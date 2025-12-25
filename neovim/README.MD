# Neovim Configuration (Tiered Setup)
 Esta é uma configuração modular e nativa em **Lua** para o Neovim, projetada para escalar desde ambientes hostis (servidores antigos) até um ambiente de desenvolvimento completo.

## 📂 Estrutura dos Arquivos
 A configuração é dividida em três níveis de complexidade. Cada nível herda do anterior através do comando `require`:

### 1. `minimal.lua` (Rescue Mode)
 * **Foco:** Compatibilidade, velocidade bruta e "Rescue Mode".
 * **Características:**
     * Usa apenas a API nativa (`vim.opt`, `vim.keymap`) sem plugins.
     * Configurações de segurança (sem backup/swap).
     * Ideal para: `root`, servidores remotos, edição rápida de arquivos `.conf`.

### 2. `standard.lua` (Daily Driver)
 * **Foco:** Edição confortável e visual moderno.
 * **Herda de:** `minimal.lua`
 * **Características:**
     * Ativa `termguicolors` e colorscheme (Evening).
     * **Cursor Nativo:** Usa `guicursor` para controlar o formato do cursor (bloco/linha) sem precisar de escape codes antigos.
     * Suporte a Mouse e Clipboard do sistema (`unnamedplus`).
     * Indentação padrão (4 espaços).

### 3. `ultimate.lua` (Pro / IDE)
 * **Foco:** Produtividade máxima e desenvolvimento de software.
 * **Herda de:** `standard.lua`
 * **Características:**
     * **Mappings Avançados:** `Space` como Leader key.
     * **Smart Backspace:** Função Lua dedicada para deletar indentação ou caracteres de forma inteligente.
     * **Visual Feedback:** Pisca o texto copiado (`TextYankPost`), recurso nativo do Lua.
     * **Linguagens (Autocmds):** Configuração granular:
         * *Web/Lua:* 2 espaços.
         * *C/C++/Rust/Java:* 4 espaços.
         * *Go/Assembly/Make:* Tabs reais (`noexpandtab`).

---

## 🚀 Instalação e Uso

### Pré-requisito: Pasta `lua`
 Para que o comando `require` funcione, seus arquivos `.lua` **devem** estar dentro de uma pasta chamada `lua` na raiz da configuração do Neovim.

 Estrutura recomendada:
 ```text
 nvim/
 ├── init.lua          <-- Arquivo de entrada
 └── lua/              <-- Pasta OBRIGATÓRIA
     ├── minimal.lua
     ├── standard.lua
     └── ultimate.lua
 ```

### Opção A: Carregamento Manual (Recomendado)
 No seu arquivo `init.lua` principal, carregue apenas o nível que deseja utilizar.

 Para usar a versão completa:

 ```lua
 -- init.lua
 require("ultimate")
 ```

 Para usar a versão leve em um servidor:

 ```lua
 -- init.lua
 require("minimal")
 ```

### Opção B: Seleção Dinâmica
 Você pode colocar isso no seu `init.lua` para carregar baseada em uma variável de ambiente do sistema operacional:

 ```lua
 -- init.lua
 if os.getenv("NVIM_MINIMAL") then
     require("minimal")
 else
     require("ultimate")
 end
 ```

---

## 📍 Caminhos
 * **Unix/Linux/Mac:** `~/.config/nvim/`
 * **Windows:** `~\AppData\Local\nvim\`
 * **Arquivo de Entrada:** `init.lua`

## ✨ Diferenças para a versão VimScript
 Esta versão Lua traz vantagens específicas sobre a versão `.vim` tradicional:

 1. **Performance:** Acesso direto à API C do Neovim via `vim.opt` e `vim.api`, sem tradução de Vimscript.
 2. **Estabilidade:** Uso de `pcall` (protected call) para carregar módulos, evitando quebras se um arquivo estiver faltando.
 3. **Modernidade:** Substituição de hacks de terminal (`t_SI`) por configurações nativas (`guicursor`).
