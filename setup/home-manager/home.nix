{ config, pkgs, ... }:

{
  # --- Identity / basics ---
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";
  home.stateVersion = "25.11";

  # --- Packages (Neovim + plugins + tooling deps) ---
  home.packages = with pkgs; [
    # Core utilities commonly needed by plugin installers / tools
    git
    curl
    unzip
    gnutar
    gzip

    # Telescope: file finding + grep
    ripgrep
    fd

    # Native builds (telescope-fzf-native, treesitter parsers, etc.)
    gnumake
    clang
    pkg-config

    # Copilot.vim dependency
    nodejs

    # Git TUI (you use lazygit.nvim)
    lazygit

    # Markdown preview (you use glow.nvim)
    glow

    # Formatters you referenced in conform config
    ruff
    black
    clang-tools   # clang-format (and clangd if you ever want it system-side)
    stylua
    nodePackages.prettier

    # LaTeX toolchain (vimtex / texlab helpers: latexmk, latexindent, etc.)
    texlive.combined.scheme-medium

    # Viewer helpers (vimtex uses xdg-open fallback; zathura is nice if you use it)
    xdg-utils
    zathura
  ];

  # --- Dotfiles (optional; keep empty if you're using stow for everything) ---
  home.file = {
    # Example:
    # ".config/nvim".source = /path/to/your/nvim;
  };

  # --- Session variables ---
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # --- Git ---
  programs.git = {
    enable = true;
    userName = "Ryan McMillan";
    userEmail = "ryan.j.mcmillan34@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # --- GitHub CLI ---
  programs.gh = {
    enable = true;
  };

  # --- Zsh / Oh-My-Zsh ---
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "sudo" "z" ];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      # Avoid "user@host" in prompt for DEFAULT_USER
      DEFAULT_USER="$USER"
      RPROMPT=""

      # Optional: customize agnoster-ish prompt functions
      prompt_dir() {
        prompt_segment blue $CURRENT_FG '%2~'
      }

      prompt_git() {
        local branch
        branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
        prompt_segment green $CURRENT_FG " ${branch}"
      }

      PROMPT=$'\n'"$PROMPT"
    '';
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
