# dotflies

Personal Neovim and VS Code configuration snapshot. The VS Code extension list is a snapshot of installed extensions; versions are documented in `vscode/extensions.txt`, while the install command uses extension IDs so it can install current versions.

## Neovim

This configuration uses [AstroNvim v6](https://docs.astronvim.com/) and [lazy.nvim](https://github.com/folke/lazy.nvim). Install Neovim, Git, and a Nerd Font (for icons), then back up any existing `~/.config/nvim` and copy `nvim/` there:

```sh
git clone https://github.com/urdadx/dotflies.git
cp -r dotflies/nvim ~/.config/nvim
nvim
```

The first launch bootstraps lazy.nvim. `nvim/lazy-lock.json` records the plugin versions from this machine. Copilot features require signing in to GitHub Copilot separately. The live setup has unused AstroNvim example/template files; this snapshot keeps only active configuration and supporting files.

**Active customization:** Space is the leader and comma is the local leader. `navigation-mappings.lua` adds Ctrl+B/Ctrl+E for Neo-tree, Ctrl+P for files, Ctrl+F for buffer search, Ctrl+Shift+F for project search, Ctrl+S for save, Ctrl+L for cursorline, Shift+arrows for selection, Ctrl+Shift+Up/Down for line/selection duplication, and Ctrl+D for multi-cursor selection. Neo-tree uses `n`/`f`/`d` for new file/folder/delete. `javascript-diagnostics.lua` enables `ts_ls`, installs TypeScript language server through Mason, and displays inline diagnostics. `copilot.lua` enables suggestions (`Ctrl+Y` to accept) and Copilot Chat (`Space a a/e/f/r` to toggle/explain/fix/review).

## VS Code

Install VS Code, then copy `vscode/settings.json` and `vscode/keybindings.json` into your VS Code user directory (Linux: `~/.config/Code/User/`; macOS: `~/Library/Application Support/Code/User/`; Windows: `%APPDATA%\Code\User\`). Back up existing files first. VS Code accepts the JSON-with-comments format used by these files.

Install the saved extensions:

```sh
while IFS=@ read -r extension version; do
  [ -n "$extension" ] && code --install-extension "$extension"
done < dotflies/vscode/extensions.txt
```

`vscode/extensions.txt` records extension IDs **and the installed versions** at capture time. To install those exact versions, use `code --install-extension "publisher.extension@version"` for a given entry instead. The editor uses Geist Mono, One Hunter Flexoki Light, Material Icon Theme, Fluent Icons, 2-space indentation, format-on-save, and language-specific Biome/Prettier/Oxc/Black/rust-analyzer/Go formatting. Keybindings customize the integrated terminal, file explorer, file utilities, line duplication, and expand-region shortcuts. Install the Geist Mono font separately if desired.

The published VS Code settings omit saved PostgreSQL connection profiles and machine-specific Python/Flutter/Android SDK paths. Add those back in your local settings if needed; connection credentials and extension state live outside this repo. VS Code Settings Sync, workspace settings, extension caches, account tokens, history, and `mcp.json` are not included.

## Updating the snapshot

Copy active Neovim config changes into `nvim/`, review VS Code user settings for connection profiles, credentials, and local paths before updating `vscode/settings.json`, and refresh the extension list with `code --list-extensions --show-versions`. Review the staged diff before publishing.
