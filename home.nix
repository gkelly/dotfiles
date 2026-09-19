{
  config,
  inputs,
  pkgs,
  ...
}:

let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    ./git.nix
    ./helix.nix
    ./rust.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.username = "gkelly";
  home.homeDirectory = "/home/gkelly";
  news.display = "silent";
  targets.genericLinux.enable = true;

  xdg.userDirs = {
    enable = true;
    desktop = config.home.homeDirectory;
    documents = config.home.homeDirectory;
    download = config.home.homeDirectory;
    music = config.home.homeDirectory;
    pictures = config.home.homeDirectory;
    publicShare = config.home.homeDirectory;
    templates = config.home.homeDirectory;
    videos = config.home.homeDirectory;
  };

  programs.home-manager.enable = true;

  programs.alacritty = {
    enable = true;
    settings.selection.save_to_clipboard = true;
  };

  home.packages = with pkgs; [
    age
    age-plugin-yubikey
    cachix
    eza
    fd
    fzf
    gh
    git
    go
    gopls
    ripgrep

    llm-agents.claude-code
    llm-agents.codex
    llm-agents.crush
    llm-agents.pi
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

  home.stateVersion = "26.05";
}
