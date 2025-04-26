# Dotfiles Repository

This repository contains my personal dotfiles and configuration scripts for setting up a development environment on Linux. It includes configurations for various tools, applications, and environments.

---

## Installation

To install the dotfiles, run the following command in your terminal:

```bash
git clone https://github.com/rmcmillan34/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Depending on the environment you want to set up, you can run one of the following using the included Makefile.

```bash
./bootstrap.sh        # for core tools
./devtools.sh         # for developer tools
./desktop.sh          # for GUI environment
```

### Tools and Applications

This repository includes configurations for the following tools and applications. The list is not exhaustive, but it covers the most important ones.

| Tool    | Program          | Description                                           | Environments |
|---------|------------------|----------------------------------------------------------------|-----|
|Shell    | Zsh (Z Shell)    | customisable shell for running terminal commands and scripting | all |
|Terminal | Alacritty        | fast terminal emulator                                         | all |
|Terminal | Tmux             | terminal multiplexer                                           | all |
|Editor   | Neovim           | extensible text editor                                         | all |
|Editor   | LaTeX            | typesetting system for documents                               | all |
|Git      | Git              | version control system                                         | all |
|Git      | LazyGit          | terminal UI for Git                                            | all |
|Theme    | Oh My Zsh        | framework for managing Zsh configuration                       | all |
|Theme    | Catppuccin-Mocha | colour scheme for terminal and editor                          | all |
|AI Tools | GitHub Copilot   | AI pair programmer                                             | all |
|AI Tools | ChatGPT CLI      | AI chatbot                                                     | all |
|Font     | TBD              | font for terminal and editor                                   | all |
|i3       | i3-gaps          | tiling window manager                                      | desktop | 

---

## Repository Structure
The repository is structured to allow the easy installation and management of dotfiles using `stow`. The main directories are as follows:

```bash
.
├── bootstrap.sh           -- Bootstrap script for core tools
├── desktop.sh             -- Bootstrap script for GUI environment
├── devtools.sh            -- Bootstrap script for developer tools
├── Makerfile              -- Makefile for automating dotfiles
├── README.md
├── scripts
│   ├── install-fonts.sh   -- Script to install fonts
│   └── install-ly.sh      -- Script to install ly (login manager)
└─ setup
    ├── alacritty
    ├── git
    ├── i3
    ├── ly
    ├── nvim
    └── tmux
```

---

## Usage

### Stow
