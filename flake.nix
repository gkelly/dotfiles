{
  inputs = {
    codex-cli = {
      url = "github:sadjow/codex-cli-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    claude-code-cli = {
      url = "github:sadjow/claude-code-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tmux-colors-solarized = {
      url = "github:seebi/tmux-colors-solarized";
      flake = false;
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      homeConfiguration =
        system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs; };

          modules = [
            ./git.nix
            ./helix.nix
            ./home.nix
            ./tmux.nix
            ./zsh.nix
          ];
        };
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt);

      homeConfigurations = nixpkgs.lib.mapAttrs' (
        system: configuration: nixpkgs.lib.nameValuePair "gkelly-${system}" configuration
      ) (forAllSystems homeConfiguration);
    };
}
