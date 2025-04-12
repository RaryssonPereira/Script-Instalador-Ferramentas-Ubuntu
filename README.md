# ⚙️ Ubuntu Init Tools

Este repositório contém um script interativo para **instalar rapidamente ferramentas essenciais e úteis no Ubuntu Server**, ideal para iniciantes, desenvolvedores e sysadmins que desejam começar com um ambiente pronto para uso.

O objetivo é ajudar **novos programadores e desenvolvedores iniciantes** a prepararem seu servidor Ubuntu com praticidade, segurança e boas escolhas de ferramentas.

---

## 📜 Sobre o script

Arquivo: `ubuntu-init-tools.sh`  
Criado por: [Rarysson](https://github.com/RaryssonPereira)  
Objetivo: Automatizar a instalação das ferramentas mais utilizadas em servidores Ubuntu.

---

## 🔧 O que o script faz?

1. Atualiza a lista de pacotes do sistema.
2. Instala ferramentas essenciais como: `vim`, `curl`, `git`, `htop`, entre outras.
3. Exibe uma descrição clara de cada ferramenta antes de instalar.
4. Pergunta ao usuário quais ferramentas ele deseja instalar.
5. (Opcional) Mostra ferramentas adicionais úteis para desenvolvimento ou administração avançada.
6. Organiza e melhora a experiência de uso com um menu interativo.

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
