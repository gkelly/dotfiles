{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    rust-analyzer
    cargo
    rustfmt
    clippy
  ];
}
