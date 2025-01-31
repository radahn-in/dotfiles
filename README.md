# Dotfiles

My personal Neovim configuration for a streamlined development experience. Built with [LazyVim](https://www.lazyvim.org/) and inspired by [craftzdog/dotfiles](https://github.com/craftzdog/dotfiles-public).

![Neovim Screenshot](screenshot.png) <!-- Add a screenshot if available -->

---

## ✨ Features

- **Neovim ≥0.9.0**: Optimized for the latest features.
- **LazyVim**: Fast plugin management with lazy loading.
- **Solarized Osaka**: A custom color scheme blending Solarized and Osaka vibes.
- **Telescope Integration**: Fast file navigation with fuzzy finding.
- **Optional GUI Tools**: Includes lazygit and Nerd Fonts support.

---

## 🛠️ Installation

### Requirements

- **Neovim ≥0.9.0** (must be [built with LuaJIT](https://github.com/neovim/neovim/wiki/Building-Neovim))
- **Git ≥2.19.0**
- **C Compiler** (e.g., `gcc` or `clang`) for Treesitter parsers.

### Optional Dependencies

| Tool          | Purpose                          |
|---------------|----------------------------------|
| **ripgrep**   | Fast text search (`:Telescope live_grep`) |
| **fd**        | Efficient file finder (`:Telescope find_files`) |
| **lazygit**   | Git TUI integration              |
| **Nerd Font** | Icons in Neovim (e.g., [FiraCode Nerd Font](https://www.nerdfonts.com/)) |

### Steps

1. **Backup existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
2. **Clone this repository**:
   ```bash
   git clone https://github.com/radahn-in/dotfiles.git ~/.config/nvim
3. **Install Neovim ≥0.9.0*:
    - Linux/macOS: Build from source.
    - Windows: Use scoop or the official release.
4. **Install Dependencies**:
   - **ripgrep**: ```sudo apt install ripgrep``` (Debian/Ubuntu) or ```brew install ripgrep``` (macOS).
   - **fd**: ```sudo apt install fd-find``` or ```brew install fd```.

---

## 🎨 Color Scheme

### Solarized Osaka
A custom blend of the Solarized palette and Tokyo Night's aesthetics. Ensure your terminal emulator supports true color for the best experience.

---

## 🤝 Contributing
Feel free to open issues or PRs for suggestions and improvements!

---

📜 License

MIT © [radahn-in]

---
## 🙏 Acknowledgments
- Inspired by Takuya Matsuyama’s dotfiles.
- Powered by LazyVim.

