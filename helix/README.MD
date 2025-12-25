# Helix Configuration (Tiered Setup)
 Configuração modular para o editor Helix, estruturada em níveis de complexidade.

## 📂 Localização
 | Sistema Operacional | Caminho da Pasta |
 | :--- | :--- |
 | **Unix (Linux/macOS)** | `~/.config/helix/` |
 | **Windows** | `%AppData%\helix\` |

## 🚀 Instalação
 O Helix não suporta carregamento dinâmico de configurações. É necessário copiar o arquivo desejado e renomeá-lo para `config.toml`.

### 1. Configurar Linguagens (Obrigatório)
 Copie o arquivo `languages.toml` para a pasta de configuração para garantir a indentação correta (Tabs para Go, 2 espaços para Web, etc).

### 2. Selecionar o Perfil
 Copie o conteúdo de um dos arquivos abaixo para `config.toml`:

 * **`minimal.toml`**: Modo de compatibilidade (SSH/TTY). Sem mouse, tema básico.
 * **`standard.toml`**: Uso diário. Mouse ativado, correções de `Backspace/Del` e `Esc`.
 * **`ultimate.toml`**: Modo Power User. Inclui:
     * **Space Leader:** `Space+w` (Salvar), `Space+q` (Sair).
     * **Interface:** Statusline completa, guias de indentação, bufferline.
     * **Navegação:** `C-u` / `C-d` centralizados.
