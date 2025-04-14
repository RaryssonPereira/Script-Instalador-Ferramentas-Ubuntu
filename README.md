# ⚙️ Ubuntu Init Tools

Este repositório contém um script interativo para **instalar rapidamente ferramentas essenciais e úteis no Ubuntu Server**, ideal para iniciantes, desenvolvedores e sysadmins que desejam começar com um ambiente pronto para uso.

O objetivo é ajudar **novos programadores e desenvolvedores iniciantes** a prepararem seu servidor Ubuntu com praticidade, segurança e boas escolhas de ferramentas.

---

## 📜 Sobre o script

**Arquivo:** `ubuntu-init-tools.sh`  
**Criado por:** [Rarysson](https://github.com/RaryssonPereira)  
**Objetivo:** Automatizar a instalação das ferramentas mais utilizadas em servidores Ubuntu, oferecendo uma experiência interativa.

---

## 🔧 O que o script faz?

1. Atualiza a lista de pacotes do sistema.
2. Instala ferramentas essenciais como: `vim`, `curl`, `git`, `htop`, entre outras.
3. Exibe uma descrição clara de cada ferramenta antes de instalar.
4. Pergunta ao usuário quais ferramentas ele deseja instalar individualmente.
5. Oferece configuração opcional do firewall UFW, permitindo portas SSH, HTTP e HTTPS.
6. Permite instalação opcional e individualizada de ferramentas adicionais avançadas úteis para desenvolvimento ou administração avançada.
7. Organiza e melhora a experiência de uso com um menu interativo.

---

## 🚨 Requisitos antes de usar

- Ter o **Ubuntu Server (20.04 ou superior)** instalado.
- Acesso a um terminal com permissões de `sudo`.
- Conexão com a internet ativa.

---

## ▶️ Como usar

### 1. Baixe o script

```bash
git clone https://github.com/RaryssonPereira/ubuntu-init-tools.git
cd ubuntu-init-tools
```

### 2. Torne o script executável

```bash
chmod +x ubuntu-init-tools.sh
```

### 3. Execute o script

```bash
./ubuntu-init-tools.sh
```

---

### 💡 Dica: também é possível executar assim

```bash
bash ubuntu-init-tools.sh
```

Mas o script já especifica qual shell usar com a linha `#!/bin/bash` no topo.

---

## 🔎 Ferramentas incluídas no script

### Ferramentas básicas:
- **vim** → editor de texto no terminal  
- **byobu** → gerenciador de sessões no terminal  
- **htop** → monitor de recursos do sistema  
- **net-tools** → ferramentas de rede (ifconfig, netstat, etc.)  
- **curl** e **wget** → transferência de dados via HTTP/FTP  
- **whois** → consulta de domínios  
- **dnsutils** → ferramentas DNS (dig, nslookup)  
- **speedtest-cli** → teste de velocidade de internet no terminal  
- **ufw** → firewall simplificado para o Ubuntu  
- **neofetch** → exibe informações do sistema com estilo  
- **git** → controle de versão e colaboração em código  

### Ferramentas adicionais avançadas (opcionais):
- **build-essential** → compiladores e ferramentas de desenvolvimento C/C++  
- **jq** → manipulação avançada de arquivos JSON via terminal  
- **tree** → visualização gráfica de diretórios no terminal  
- **gnupg** → criptografia e assinatura digital de arquivos  
- **tmux** → multiplexador de terminais alternativo ao byobu  
- **zsh** → shell poderoso com recursos avançados  
- **docker e docker-compose** → containerização e orquestração de aplicações  

---

## ❤️ Contribuindo

Este projeto é feito **para a comunidade e com a comunidade**.  
Se você tem sugestões, correções ou quer adicionar novas ferramentas, **envie um Pull Request ou abra uma Issue!**

---

## 📜 Licença

Este projeto está sob a **licença MIT**.  
Você pode **usar, modificar e compartilhar** livremente.

---

## ✨ Créditos

Criado com carinho por **Rarysson**,  
para ajudar outros a começarem sua jornada com **Linux e Ubuntu** da forma mais simples e poderosa possível.
