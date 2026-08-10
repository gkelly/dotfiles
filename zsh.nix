{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases.ls = "eza";
    initContent = ''
      autoload -Uz promptinit
      promptinit
      prompt walters
    '';
  };
}
