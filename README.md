# Quick Start

```bash
brew install chezmoi

chezmoi init https://github.com/wairasama/dotfiles

chezmoi apply
```

# Dotfiles

My personal, stateless workstation configuration.

The goal of this repository is to make rebuilding my Linux or macOS workstation
completely reproducible while keeping everything modular, version controlled,
and easy to maintain.

---

# Philosophy

This repository follows a few simple principles:

- Stateless workstation
- GitHub is the source of truth
- Modular configuration
- Cross-platform where possible
- Minimal manual setup
- Reproducible installations
- Terminal-first workflow
- Security-conscious

The aim is that a brand new machine can be configured with only a handful of
commands.

---

# Architecture

This workstation is built around three tools.

## Chezmoi

Responsible for configuration.

Examples:

- Zsh
- Kitty
- Starship
- Git
- SSH

## Homebrew

Responsible for installing applications.

Examples:

- Neovim
- Kitty
- Starship
- Bat
- Eza
- Ripgrep
- Lazygit

Package list:

- Brewfile

## Mise

Responsible for language runtimes.

Examples:

- Python
- Node.js
- Go
- Rust

Configuration:

- .mise.toml

---

# Repository Layout

```
dotfiles
│
├── Brewfile
├── LICENSE
├── README.md
├── dot_mise.toml
├── dot_zshenv
│
├── dot_config
│   ├── git
│   ├── kitty
│   ├── starship.toml
│   └── zsh
│
├── dot_ssh
│
├── scripts
│
└── run_once_*.sh.tmpl
```

---

# Bootstrap Process

On a new machine:

1. Install Git
2. Install Homebrew
3. Install Chezmoi
4. Clone this repository
5. Apply the configuration
6. Install language runtimes

Result:

- identical shell
- identical prompt
- identical terminal
- identical tools

---

# Daily Workflow

When changing configuration:

```
Edit configuration

↓

Test

↓

chezmoi add <file>

↓

git status

↓

git diff

↓

git add .

↓

git commit

↓

git push
```

---

# Installed Components

## Shell

- Zsh
- Starship

## Terminal

- Kitty

## Package Manager

- Homebrew

## Runtime Manager

- Mise

## Utilities

- Bat
- Eza
- FD
- FZF
- Ripgrep
- Tree
- Zoxide
- Lazygit
- Yazi

## Editor

- Neovim

---

# Supported Platforms

- Fedora Workstation
- Kali Linux
- macOS

---

# Future Improvements

- [ ] Neovim configuration
- [ ] Tmux
- [ ] Yazi configuration
- [ ] FZF improvements
- [ ] Zoxide improvements
- [ ] SSH hardening
- [ ] Secrets management
- [ ] Automated workstation verification

---

# License

MIT
