{ config, pkgs, ... }:

{
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # --- Packages (Neovim + plugin deps) ---
  home.packages = with pkgs; [
    # Core utils
    git
    curl
    unzip
    gnutar
    gzip

    # Telescope
    ripgrep
    fd

    # Native builds (telescope-fzf-native, treesitter parsers)
    gnumake
    clang
    pkg-config

    # Copilot.vim dependency
    nodejs

    # Git TUI (lazygit.nvim)
    lazygit

    # Markdown preview (glow.nvim)
    glow

    # Formatters referenced in your Conform config
    ruff
    black
    clang-tools
    stylua
    nodePackages.prettier

    # LaTeX toolchain (latexmk/latexindent etc)
    texlive.combined.scheme-medium

    # Viewer helpers
    xdg-utils
    zathura
  ];

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
  programs.gh.enable = true;

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

    # IMPORTANT: Nix interpolates ${...} inside this string.
    # Use ''${...} to pass ${...} through to zsh.
    initContent = ''
      # Avoid "user@host" prompt bit for the default user
      DEFAULT_USER="$USER"
      RPROMPT=""

      # Optional: customize prompt segments (agnoster-style)
      prompt_dir() {
        prompt_segment blue $CURRENT_FG '%2~'
      }

      prompt_git() {
        local branch
        branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
        # NOTE: ''${branch} is required so Nix doesn't try to substitute it.
        prompt_segment green $CURRENT_FG " ''${branch}"
      }

      # Add a newline before prompt (optional)
      PROMPT=$'\n'"$PROMPT"
    '';
  };

  programs.home-manager.enable = true;
}
