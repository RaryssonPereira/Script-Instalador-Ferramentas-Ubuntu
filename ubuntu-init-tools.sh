#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then 
  echo "❌ Por favor, execute este script como root (ou use sudo)"
  exit 1
fi

echo "🔄 Atualizando lista de pacotes..."
sudo apt update

# Função auxiliar para perguntar e instalar
instalar_ferramenta() {
  local nome="$1"
  local descricao="$2"
  shift 2
  read -p "👉 Deseja instalar $nome? ($descricao) [y/n]: " resposta
  if [[ "$resposta" =~ ^[Yy]$ ]]; then
    echo "🔧 Instalando $nome..."
    sudo apt install -y "$@"
  else
    echo "⏭️ Pulando $nome..."
  fi
}

# Ferramentas básicas
echo ""
echo "🚀 Instalando ferramentas básicas..."

instalar_ferramenta "Vim" "Editor de texto no terminal" vim
instalar_ferramenta "Byobu" "Gerenciador de sessões no terminal (baseado em tmux)" byobu
instalar_ferramenta "Htop" "Monitor de processos em tempo real" htop
instalar_ferramenta "Net-tools" "Ferramentas de rede como ifconfig" net-tools
instalar_ferramenta "Curl" "Requisições HTTP via terminal" curl
instalar_ferramenta "Wget" "Download de arquivos pela linha de comando" wget
instalar_ferramenta "Whois" "Consulta de domínios" whois
instalar_ferramenta "Dnsutils" "Ferramentas de DNS como dig" dnsutils
instalar_ferramenta "Speedtest-cli" "Testar velocidade da internet" speedtest-cli
instalar_ferramenta "UFW" "Firewall simples para Ubuntu" ufw
instalar_ferramenta "Neofetch" "Mostra informações do sistema no terminal" neofetch
instalar_ferramenta "Git" "Controle de versão e colaboração" git

# Pergunta se deseja ver ferramentas adicionais
echo ""
read -p "🔍 Deseja visualizar e instalar ferramentas adicionais avançadas? [y/n]: " extras

if [[ "$extras" =~ ^[Yy]$ ]]; then
  echo ""
  echo "✨ Ferramentas adicionais (avançadas ou úteis para desenvolvimento)"
  instalar_ferramenta "Build-essential" "Compiladores e ferramentas C/C++" build-essential
  instalar_ferramenta "JQ" "Manipulação de arquivos JSON no terminal" jq
  instalar_ferramenta "Tree" "Visualização de diretórios em árvore" tree
  instalar_ferramenta "GnuPG" "Criptografia e assinatura de arquivos" gnupg
  instalar_ferramenta "Tmux" "Multiplexador de terminal alternativo ao byobu" tmux
  instalar_ferramenta "ZSH" "Shell alternativo poderoso" zsh
  instalar_ferramenta "Docker" "Containerização de aplicações" docker.io
  instalar_ferramenta "Docker Compose" "Orquestração de containers" docker-compose
else
  echo "⏭️ Pulando ferramentas adicionais."
fi

echo ""
echo "✅ Instalação finalizada! Aproveite seu ambiente Ubuntu com as ferramentas que você escolheu!"
