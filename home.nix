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

  news.display = "silent";
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

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

    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono

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
