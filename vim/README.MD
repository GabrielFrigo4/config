# Vim Configuration (Tiered Setup)
 Esta é uma configuração modular do Vim projetada para escalar desde ambientes hostis (servidores antigos) até um ambiente de desenvolvimento completo.

## 📂 Estrutura dos Arquivos
 A configuração é dividida em três níveis de complexidade. Cada nível herda do anterior:

### 1. `minimal.vim` (Rescue Mode)
 * **Foco:** Compatibilidade máxima e servidores remotos via SSH.
 * **Características:**
     * Sem plugins, sem cores `termguicolors`.
     * Funciona em versões antigas do Vim.
     * Configurações de segurança (sem backup/swap).
     * Ideal para: `root`, servidores legacy, Docker containers.

### 2. `standard.vim` (Daily Driver)
 * **Foco:** Edição confortável e visual agradável.
 * **Herda de:** `minimal.vim`
 * **Características:**
     * Ativa `termguicolors` e colorscheme (Evening).
     * Suporte a Mouse e Clipboard do sistema.
     * Numeração híbrida (relativa + absoluta).
     * Indentação padrão (4 espaços).

### 3. `ultimate.vim` (Pro / IDE)
 * **Foco:** Produtividade máxima e desenvolvimento de software.
 * **Herda de:** `standard.vim`
 * **Características:**
     * **Mappings Avançados:** `Space` como Leader key, Backspace inteligente.
     * **Linguagens:** Configuração granular de indentação:
         * *Web/Lua:* 2 espaços.
         * *C/C++/Rust/C#:* 4 espaços.
         * *Go/Assembly/Python:* Tabs reais (`noexpandtab`).
     * **UX:** Menus melhores (`wildmenu`), split inteligente.

---

## 🚀 Instalação e Uso

### Opção A: Carregamento Manual (Recomendado)
 No seu arquivo `~/.vimrc` principal, carregue apenas o nível que deseja utilizar no momento.

 Para usar a versão completa:
 ```vim
 " ~/.vimrc
 source ~/vimfiles/vimrc/ultimate.vim
 ```

 Para usar a versão leve em um servidor:

 ```vim
 " ~/.vimrc
 source ~/vimfiles/vimrc/minimal.vim
 ```

### Opção B: Seleção Dinâmica
 Você pode colocar isso no seu `.vimrc` para carregar baseada no hostname ou em uma variável de ambiente:

 ```vim
 if exists('$VIM_MINIMAL')
     source ~/vimfiles/vimrc/minimal.vim
 else
     source ~/vimfiles/vimrc/ultimate.vim
 endif
 ```

## 📍 Caminhos
 * **Repositório:** `~/vimfiles/vimrc`
 * **Vimrc do Usuário:** `~/.vimrc`
