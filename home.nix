{
  config,
  inputs,
  pkgs,
  ...
}:

{
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

  home.packages = with pkgs; [
    age
    age-plugin-yubikey
    eza
    fd
    gh
    git
    go
    gopls
    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono
    ripgrep
    typst

    inputs.claude-code-cli.packages.aarch64-linux.default
    inputs.codex-cli.packages.aarch64-linux.default
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

  home.stateVersion = "26.05";
}
