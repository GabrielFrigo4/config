# Emacs Configuration (Modular & Native 30+)
 Configuração moderna e modular para o Emacs, focada em recursos nativos do **Emacs 30+** (Treesit, Eglot, EditorConfig) e organizada em níveis de complexidade.

## 📂 Localização e Caminhos
 Os arquivos `.el` da configuração (`minimal.el`, `standard.el`, `ultimate.el`) devem ser colocados na **pasta de configuração do usuário**:

 | Sistema Operacional | Pasta de Configuração (`user-emacs-directory`) | Arquivo de Inicialização (`init.el`) |
 | :--- | :--- | :--- |
 | **Unix (Linux/macOS)** | `~/.emacs.d/` | `~/.emacs.d/init.el` |
 | **Windows** | `%AppData%\.emacs.d\` | `~/_emacs` ou `~/.emacs.d/init.el` |

> **⚠️ Aviso para Windows:** Para o correto funcionamento do `emacs-client` (e evitar bugs de encoding), é necessário ativar o suporte global a UTF-8 no sistema.
>
> Acesse as configurações de **Hora e Idioma > Idioma e Região > Idioma de Exibição do Windows** e marque a opção *"Beta: Use Unicode UTF-8 for worldwide language support"*.
>
> **Guias passo a passo:**
> * [Windows 10](https://scholarslab.lib.virginia.edu/learn-twarc/08-win-region-settings)
> * [Windows 11](https://windows.atsit.in/32315/)

---

## 🚀 Instalação e Uso
 Esta configuração usa um sistema de **cascata**. Você só precisa carregar o nível mais alto que deseja usar no seu `init.el`, e ele carregará os níveis inferiores automaticamente.

 Adicione **uma** das linhas abaixo ao seu arquivo de inicialização:

### 1. Ultimate (Recomendado)
 Carrega: *Ultimate → Standard → Minimal*.
 ```elisp
 ;; init.el
 (load (expand-file-name "ultimate" user-emacs-directory))
 ```

### 2. Standard (Leve)
 Carrega: *Standard → Minimal*.

 ```elisp
 ;; init.el
 (load (expand-file-name "standard" user-emacs-directory))
 ```

### 3. Minimal (Rescue Mode)
 Carrega apenas o básico.

 ```elisp
 ;; init.el
 (load (expand-file-name "minimal" user-emacs-directory))
 ```

---

## ✨ Perfis de Configuração

### `minimal.el` (Rescue Mode)
 * **Foco:** Compatibilidade e velocidade.
 * **Uso:** Terminais simples, servidores remotos, edições rápidas.
 * **Recursos:** Limpeza de UI (sem barras), UTF-8 forçado, comportamento seguro (sem backups `~`).

### `standard.el` (Daily Driver)
 * **Foco:** Conforto e recursos nativos do Emacs 30.
 * **Recursos:**
 * **Which-key Nativo:** Mostra atalhos disponíveis automaticamente.
 * **Fido-mode:** Interface de busca vertical moderna (similar ao Telescope).
 * **Pixel Scroll:** Rolagem suave de alta precisão.
 * **EditorConfig:** Suporte nativo a arquivos `.editorconfig`.

### `ultimate.el` (Native IDE)
 * **Foco:** Desenvolvimento de software de alto desempenho.
 * **Recursos:**
 * **Treesit:** Highlight de sintaxe baseado em AST (muito mais rápido que regex).
 * *Dica:* Use `M-x my/install-grammars` na primeira vez para instalar as linguagens.
 * **Eglot:** Cliente LSP nativo (leve e integrado).
 * **Project.el:** Gerenciamento de projetos nativo.
 * **Indentação Híbrida:** Configurada automaticamente (Tabs para Go/Make, Espaços para o resto).
