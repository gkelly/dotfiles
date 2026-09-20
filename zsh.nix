{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      la = "eza -la";
      l = "eza -lh --git";
      tree = "eza --tree";
    };
    initContent = ''
      autoload -Uz promptinit
      promptinit
      prompt walters
    '';
  };
}
