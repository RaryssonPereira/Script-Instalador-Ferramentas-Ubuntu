#!/bin/bash

# Verifica execução como root
if [ "$EUID" -ne 0 ]; then 
  echo "❌ Por favor, execute este script como root (ou use sudo)."
  exit 1
fi

# Verifica se o sistema é Ubuntu
if ! grep -qi ubuntu /etc/os-release; then
  echo "❌ Este script é compatível somente com Ubuntu."
  exit 1
fi

echo "🔄 Atualizando lista de pacotes..."
apt update

# Função auxiliar para perguntar e instalar com validação
instalar_ferramenta() {
  local nome="$1"
  local descricao="$2"
  shift 2
  read -rp "👉 Deseja instalar $nome? ($descricao) [y/n]: " resposta
  if [[ "$resposta" =~ ^[Yy]$ ]]; then
    echo "🔧 Instalando $nome..."
    if apt install -y "$@"; then
      echo "✅ $nome instalado com sucesso!"
    else
      echo "❌ Houve um erro ao instalar $nome!"
    fi
    return 0
  else
    echo "⏭️ Pulando $nome..."
    return 1
  fi
}

# Ferramentas básicas
echo -e "\n🚀 Instalando ferramentas básicas..."

instalar_ferramenta "Vim" "Editor de texto no terminal" vim
instalar_ferramenta "Byobu" "Gerenciador de sessões no terminal (baseado em tmux)" byobu
instalar_ferramenta "Htop" "Monitor de processos em tempo real" htop
instalar_ferramenta "Net-tools" "Ferramentas de rede como ifconfig" net-tools
instalar_ferramenta "Curl" "Requisições HTTP via terminal" curl
instalar_ferramenta "Wget" "Download de arquivos pela linha de comando" wget
instalar_ferramenta "Whois" "Consulta de domínios" whois
instalar_ferramenta "Dnsutils" "Ferramentas de DNS como dig" dnsutils
instalar_ferramenta "Speedtest-cli" "Testar velocidade da internet" speedtest-cli

# Instalação do UFW com controle de configuração posterior
ufw_disponivel=false
if instalar_ferramenta "UFW" "Firewall simples para Ubuntu" ufw; then
  ufw_disponivel=true
fi

instalar_ferramenta "Neofetch" "Mostra informações do sistema no terminal" neofetch
instalar_ferramenta "Git" "Controle de versão e colaboração" git

# Pergunta se deseja configurar firewall somente se instalado agora
if [[ "$ufw_disponivel" == true ]]; then
  echo -e "\n🛡️ A configuração padrão do UFW vai:"
  echo "- Permitir conexões SSH na porta que você especificar"
  echo "- Permitir conexões HTTP (porta 80)"
  echo "- Permitir conexões HTTPS (porta 443)"
  echo "- Bloquear todas as outras conexões não autorizadas"
  porta_detectada=$(grep -i "^Port " /etc/ssh/sshd_config | awk '{print $2}' | head -n1)
  porta_sugerida=${porta_detectada:-22}
  read -rp "👉 Qual é a porta SSH que você utiliza para acessar esse servidor? [detectada: ${porta_sugerida}]: " porta_ssh
  porta_ssh=${porta_ssh:-$porta_sugerida}
  read -rp "🔐 Deseja aplicar essa configuração e ativar o UFW? [y/n]: " configurar_ufw
  if [[ "$configurar_ufw" =~ ^[Yy]$ ]]; then
    ufw allow "$porta_ssh"/tcp
    ufw allow http
    ufw allow https
    ufw enable
    echo "✅ Firewall UFW configurado e ativado!"
  else
    echo "⏭️ Pulando configuração do firewall."
  fi
fi

# Ferramentas adicionais (com escolha individual)
echo ""
read -rp "🔍 Deseja visualizar ferramentas adicionais avançadas? [y/n]: " extras

if [[ "$extras" =~ ^[Yy]$ ]]; then
  echo -e "\n✨ Escolha quais ferramentas adicionais você deseja instalar:"

  instalar_ferramenta "Build-essential" "Compiladores e ferramentas C/C++" build-essential
  instalar_ferramenta "JQ" "Manipulação de arquivos JSON no terminal" jq
  instalar_ferramenta "Tree" "Visualização de diretórios em árvore" tree
  instalar_ferramenta "GnuPG" "Criptografia e assinatura de arquivos" gnupg
  instalar_ferramenta "Tmux" "Multiplexador de terminal alternativo ao byobu" tmux
  instalar_ferramenta "ZSH" "Shell alternativo poderoso" zsh

  # Docker e Docker Compose com pós-configuração
  instalar_ferramenta "Docker" "Containerização de aplicações" docker.io
  instalar_ferramenta "Docker Compose" "Orquestração de containers" docker-compose

  if command -v docker >/dev/null; then
    echo "⚙️ Configurando Docker para execução sem sudo..."
    usermod -aG docker "$SUDO_USER" && echo "✅ Usuário '$SUDO_USER' adicionado ao grupo docker."
    systemctl enable docker
    systemctl start docker
  fi
else
  echo "⏭️ Pulando ferramentas adicionais."
fi

# Limpeza final
echo ""
echo "🧹 Limpando pacotes desnecessários..."
apt autoremove -y >/dev/null

echo -e "\n🎉 Ambiente Ubuntu pronto para uso! Boas codificações!"
