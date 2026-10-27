<div align="center">

# ✨ `beta`'s dotfiles ✨

*A cozy, keyboard-driven Linux rice — Hyprland + Kitty + Neovim, managed with GNU Stow.*

![Linux](https://img.shields.io/badge/OS-Linux-black?logo=linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/WM-Hyprland-blueviolet?logo=hyprland&logoColor=white)
![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Neovim](https://img.shields.io/badge/Editor-Neovim-57A143?logo=neovim&logoColor=white)
![Stow](https://img.shields.io/badge/Managed%20with-GNU%20Stow-orange)

</div>

---

## 📖 Table of Contents

- [About](#-about)
- [Structure](#-structure)
- [Files & Descriptions](#-files--descriptions)
  - [Root](#root)
  - [Hyprland](#hyprland)
  - [Waybar](#waybar)
  - [Kitty](#kitty)
  - [Neovim](#neovim)
  - [Fonts](#fonts)
  - [Media](#media)
  - [System & Misc](#system--misc)
- [Keybindings](#%EF%B8%8F-keybindings)
- [Installation](#-installation)
  - [Prerequisites](#1-prerequisites)
  - [Install GNU Stow](#2-install-gnu-stow)
  - [Clone the Dotfiles](#3-clone-the-dotfiles)
  - [Stow Everything](#4-stow-everything)
  - [Useful Stow Commands](#5-useful-stow-commands)
  - [Adopting Existing Files](#6-adopting-existing-files-conflict-resolution)
  - [Unstowing / Removing](#7-unstowing--removing)
- [Post-Install Steps](#-post-install-steps)
- [Credits](#-credits)

---

## 🌌 About

This repository holds **every configuration file** for my daily-driver Linux setup
(Fedora / Arch — the dotfiles are portable between both). Everything lives in
[XDG-compliant](https://specifications.freedesktop.org/basedir-spec/latest/) paths and is
symlinked into `$HOME` with **GNU Stow**, so the repo can live anywhere and stay version-controlled.

> 🗂️ **Layout philosophy:** this repo *is* `$HOME`. Each top-level "package"
> (`.config`, `.local`, `.bashrc`, …) mirrors the real home directory, which is exactly
> what Stow expects — one `stow` command and every file is linked in place.

---

## 🗂️ Structure

```
🏠 ~/.dots
├── 📄 .bashrc                     → Interactive shell config
├── 📄 .profile                    → Environment variables & PATH
├── 📄 .stow-local-ignore          → Files Stow should never link
├── 📁 .config
│   ├── 📁 hypr                    → Hyprland WM, lock screen, wallpaper
│   ├── 📁 waybar                  → Status bar, theme, helper scripts
│   ├── 📁 kitty                   → Terminal emulator
│   ├── 📁 nvim                    → Neovim (lazy.nvim, LSP, plugins)
│   ├── 📁 fastfetch               → System-info fetch tool
│   ├── 📁 btop                    → System monitor
│   ├── 📁 mpv / mpd / ncmpcpp     → Media playback stack
│   ├── 📁 pipewire                → Audio server
│   └── 📁 fonts (see .local)
└── 📁 .local
    └── 📁 share/fonts             → Nerd Fonts & Noto typefaces
```

---

## 📋 Files & Descriptions

### Root

| File | Description |
|------|-------------|
| `.bashrc` | Interactive shell setup — `vi` editing mode, a two-line **λ prompt** with colors and the git branch, and a pile of quality-of-life aliases (`ls` grouped by dirs, `graph` for a pretty git log, `vfg`/`hypr`/`dot` quick-edit shortcuts, `todo`/`goals` journals). Defines helper functions: `grepp` / `grepl` (project-aware recursive grep that skips `.venv`, `node_modules`, caches), `ytdl` (yt-dlp → mp3), and `clocc` (counts lines of code). |
| `.profile` | Loaded at login. Exports the **XDG base directories**, sensible defaults (`BROWSER=firefox`, `TERMINAL=kitty`, `EDITOR=nvim`), toolchain homes (Java, Android, Flutter, Go, Cargo, Rustup, Ollama, Jupyter, CUDA…), the assembled `PATH`, and finally sources `.bashrc`. |
| `.stow-local-ignore` | Tells GNU Stow which files to skip when symlinking (junk like `README.md`, git metadata, editor droppings) so they never leak into `$HOME`. |

### Hyprland

| File | Description |
|------|-------------|
| `hypr/hyprland.lua` | The heart of the desktop — written in **Hyprland's Lua config API**. Configures: dual monitors (`eDP-1` 1920×1200@120 laptop panel + `HDMI-A-1` 1080p external, with workspaces 1–10 mapped across them), programs (kitty, ranger, firefox, hyprlock), all keybindings, window rules, and autostart. See the [keybindings table](#%EF%B8%8F-keybindings) below. |
| `hypr/hyprlock.conf` | Screen locker — what you see when `SUPER + L` is pressed. |
| `hypr/hyprpaper.conf` | Wallpaper daemon config, pointing at the bundled `wallpaper` image. |
| `hypr/wallpaper` | The desktop background image. |

### Waybar

| File | Description |
|------|-------------|
| `waybar/config.jsonc` | Floating, rounded status bar. Left: workspaces shown as **Japanese numerals (一 二 三 …)**, focused window, tray. Center: clock. Right: network, disk, CPU, **custom temperature module**, volume, battery. |
| `waybar/style.css` | The bar's theme — dark purples/blues (`#15111F`, `#AD66D0`, `#145B77`) and fonts. |
| `waybar/scripts/temp.sh` | Feeds the CPU-temperature module (polled continuously). |
| `waybar/scripts/memory.sh` | Feeds the RAM-usage module. |
| `waybar/scripts/toggle.sh` | Shows/hides the bar — bound to `SUPER + B`. |

### Kitty

| File | Description |
|------|-------------|
| `kitty/kitty.conf` | Terminal config — currently running the **Undefined Medium** Nerd Font (with several others commented in for easy switching), plus window, padding and behaviour tuning. |
| `kitty/1159.conf` | Alternate colorscheme/profile ("1159"). |
| `kitty/icecream.conf` | Alternate colorscheme/profile ("icecream"). |

### Neovim

A modern **lazy.nvim** setup, neatly split so each concern is its own file:

| File | Description |
|------|-------------|
| `nvim/init.lua` | Entry point — ASCII-art banner, then loads `base`, `global`, `maps`, `lazy`. |
| `nvim/lua/config/base.lua` | Core editor options (line numbers, indentation, search, etc.). |
| `nvim/lua/config/global.lua` | Globals, autocommands and general vim tweaks. |
| `nvim/lua/config/maps.lua` | All keymaps in one place. |
| `nvim/lua/config/lazy.lua` | bootstrap & config of the **lazy.nvim** plugin manager. |
| `nvim/lua/plugins/lsp.lua` | Language Server Protocol — completions, diagnostics, inlay hints. |
| `nvim/lua/plugins/treesitter.lua` | Syntax highlighting & indentation via Tree-sitter. |
| `nvim/lua/plugins/telescope.lua` | Fuzzy finder for files, buffers, grep, help. |
| `nvim/lua/plugins/oil.lua` | File management as a *buffer* (edit files like text). |
| `nvim/lua/plugins/yazi.lua` | Yazi file-manager integration. |
| `nvim/lua/plugins/theme.lua` | Colorscheme. |
| `nvim/lua/plugins/lualine.lua` | Statusline. |
| `nvim/lua/plugins/dashboard.lua` | Start screen. |
| `nvim/lua/plugins/conform.lua` | Formatting on save. |
| `nvim/lua/plugins/trouble.lua` | Pretty diagnostics/symbols list. |
| `nvim/lua/plugins/todocomments.lua` | Highlights & lists `TODO`, `FIXME`, `HACK`… |
| `nvim/lua/plugins/colorizer.lua` | Live color-code highlighting. |
| `nvim/lua/plugins/git.lua` | Git decorations & helpers. |
| `nvim/lua/plugins/codecompanion.lua` | AI-assisted coding inside Neovim. |
| `nvim/lua/plugins/flutter-tools.lua` | First-class Flutter/Dart tooling. |
| `nvim/lua/plugins/tmuxnavigator.lua` | Seamless vim↔tmux pane navigation. |
| `nvim/lua/plugins/notify.lua` | Prettier, animated notifications. |
| `nvim/lua/plugins/showkeys.lua` | On-screen display of pressed keys (great for demos). |
| `nvim/lua/plugins/tree.lua` | File-tree sidebar. |
| `nvim/lazy-lock.json` | Pinned plugin versions — guarantees reproducible Neovim. |

### Fonts

All fonts live under `.local/share/fonts/` and are picked up by fontconfig automatically.

| Directory | Description |
|-----------|-------------|
| `fonts/undefined_medium/` | **Undefined Medium** — the current Kitty terminal font. |
| `fonts/hermit/` | **Hurmit Nerd Font** — patched Hermit, ready for icons/glyphs. |
| `fonts/gohufont/` | **Gohu Font Nerd Font** — tiny, ultra-legible bitmap-style font. |
| `fonts/bluebasic/` | **BigBlue Term / 437 Nerd Fonts**. |
| `fonts/monofur/` | **Monofur Nerd Font**. |
| `fonts/noto_sans_jp/` | **Noto Sans JP** — Japanese glyphs (also used by the Waybar workspaces). |
| `fonts/noto_sans_devanagari/` | **Noto Sans Devanagari**. |

### Media

| File | Description |
|------|-------------|
| `mpv/mpv.conf` | Minimal video player config. |
| `mpd/mpd.conf` | Music Player Daemon — note it respects the `MPDCONF` env var set in `.profile`. |
| `ncmpcpp/config` | NCMPCPP UI theme (the terminal MPD client). |
| `ncmpcpp/bindings` | Custom keybindings for NCMPCPP. |

### System & Misc

| File | Description |
|------|-------------|
| `fastfetch/config.jsonc` | Catnap-inspired fetch display — bordered, colored key/value system summary. |
| `btop/btop.conf` | TUI system monitor theme & settings. |
| `pipewire/pipewire.conf` | PipeWire audio server tweaks. |
| `herdr/config.toml` | [herdr](https://github.com/) client config. (`session-snapshots/`, logs and lock files in this folder are **runtime state**, not config — don't version them.) |

---

## ⌨️ Keybindings

The `mainMod` is `SUPER` (the Windows/Command key). Full list lives in `hypr/hyprland.lua`.

| Keys | Action |
|------|--------|
| `SUPER + Return` | Open terminal (kitty) |
| `SUPER + Q` / `SUPER + W` | Firefox (default / `work` profile) |
| `SUPER + E` | File manager (ranger) |
| `SUPER + C` | Close window |
| `SUPER + F` | Fullscreen |
| `SUPER + M` | Toggle floating |
| `SUPER + P` | Toggle pseudo-tiling |
| `SUPER + H / J / K / L` | Focus left / down / up / right |
| `SUPER + SHIFT + H/J/K/L` | Move window in that direction |
| `SUPER + Tab` | Cycle windows |
| `SUPER + 1–0` / `+ SHIFT` | Go to / move window to workspace |
| `SUPER + S` / `+ SHIFT + S` | Toggle / move to special workspace *magic* |
| `SUPER + B` | Toggle Waybar |
| `SUPER + L` | Lock (hyprlock) |
| `SUPER + SHIFT + P` | Exit Hyprland |
| `Print` | Flameshot full screenshot |
| `SUPER + Mouse1 / Mouse2` | Drag / resize window |
| `XF86Audio*` | Volume, mute, mic, play/pause/next/prev (wpctl + playerctl) |
| `XF86MonBrightness*` | Brightness up/down (brightnessctl) |

---

## 🚀 Installation

The whole system is deployed with **GNU Stow** — a symlink farm manager. Stow takes each
package directory in this repo and creates **relative symlinks** back into `$HOME`, so your
config files stay version-controlled here while programs read them from the usual locations.

### 1. Prerequisites

- A Unix-like system (Linux/BSD) with `$HOME` as your user's home
- `git`
- Programs you want configs for: `hyprland`, `waybar`, `kitty`, `neovim`, `mpd`, `mpv`, `btop`, `fastfetch`, `ncmpcpp`, `pipewire`, `flameshot`, `playerctl`, `brightnessctl`, `wpctl` (pipewire-pulse)

### 2. Install GNU Stow

```bash
# Fedora / RHEL
sudo dnf install stow

# Arch / EndeavourOS
sudo pacman -S stow

# Debian / Ubuntu
sudo apt install stow

# openSUSE
sudo zypper install stow

# From source (any distro)
git clone https://git.savannah.gnu.org/git/stow.git
cd stow && ./configure && make && sudo make install
```

Verify it:

```bash
stow --version
```

### 3. Clone the dotfiles

Clone the repo **one level above `$HOME`** — Stow links *up and out* of the repo, so its
parent directory should be `$HOME` for the links to land correctly:

```bash
git clone https://github.com/<you>/dots.git ~/.dots
cd ~/.dots
```

> ✅ The repo is already laid out for this: it *mimics* `$HOME` (`./.config/…`,
> `./.local/…`, `./.bashrc`…). If your clone lives elsewhere, pass
> `--target="$HOME"` (`-t`) to every `stow` call.

### 4. Stow everything

Stow each top-level "package". A *package* is any directory in the repo; Stow recreates its
structure as symlinks inside the target (`$HOME`):

```bash
cd ~/.dots

stow .config   # → ~/.config/hypr, ~/.config/nvim, ... become symlinks
stow .local    # → fonts land in ~/.local/share/fonts
stow .bashrc   # single files can be stowed too
stow .profile
```

Or all at once in one line:

```bash
stow .config .local .bashrc .profile
```

Result — files are now *linked*, not copied:

```
~/.config/hypr/hyprland.lua  →  ../../.dots/.config/hypr/hyprland.lua
~/.config/nvim/init.lua      →  ../../.dots/.config/nvim/init.lua
~/.bashrc                    →  .dots/.bashrc
```

Edit files **in the repo**, and every linked location updates instantly.

### 5. Useful Stow Commands

```bash
stow <pkg>              # link a package into $HOME (or -t TARGET)
stow -d ~/.dots -t $HOME <pkg>   # explicit dir + target
stow -S <pkg>           # simulate / preview what would be linked
stow -R <pkg>           # restow (unlink + relink, e.g. after moving files)
stow -L                 # list every currently stowed package
stow -D <pkg>           # unstow — remove the package's symlinks
stow --ignore=...       # override ignore rules on the fly
```

### 6. Adopting existing files (conflict resolution)

If Stow complains because a real config already exists in `$HOME`, **adopt** it —
Stow moves the existing file into the repo and replaces it with a symlink:

```bash
stow --adopt .config
git diff   # review what your old configs changed
git checkout -- .   # or: keep the repo versions instead
```

### 7. Unstowing / Removing

```bash
stow -D .config .local .bashrc .profile   # remove all symlinks
```

Your real files remain untouched in `~/.dots` — safe to delete, move, or re-stow anytime.

> 💡 **Pro tip:** if you don't want *everything* stowed, just omit that package,
> e.g. skip `stow .local` on machines where you don't need the bundled fonts.

---

## 🧰 Post-Install Steps

1. **Fonts** — after `stow .local`, refresh the font cache:
   ```bash
   fc-cache -fv
   ```
2. **Shell** — log out/in (or `exec bash -l`) so `.profile` exports the environment, then restart your terminal.
3. **Neovim** — open `nvim` once; lazy.nvim will install every pinned plugin from `lazy-lock.json`.
4. **Hyprland** — launch it (or reload with `SUPER + SHIFT + R` if already inside).
5. **MPD** — `systemctl --user enable --now mpd` (music library paths are set in `mpd/mpd.conf`).

---

## 🙏 Credits

- [Hyprland](https://hypr.land/) · [Waybar](https://github.com/Alexays/Waybar) · [Kitty](https://sw.kovidgoyal.net/kitty/) · [Neovim](https://neovim.io/) + [lazy.nvim](https://github.com/folke/lazy.nvim)
- [GNU Stow](https://www.gnu.org/software/stow/) for the elegant dotfile management
- [Nerd Fonts](https://www.nerdfonts.com/) for the patched typefaces
- [fastfetch catnap theme](https://github.com/iinsertNameHere/catnap) by iinsertNameHere
- Noto fonts © Google, SIL Open Font License

<div align="center">
<sub>🌟 If you forked or riced from this, may your λ prompt always be green. 🌟</sub>
</div>
