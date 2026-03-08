{
  description = "Erina's configuration for nixvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { self, nixpkgs, nixvim }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixvim' = nixvim.legacyPackages.${system};
    in {
      homeModules.default = { config, ... }: {
        imports = [ nixvim.homeModules.default ];

        programs.nixvim = {
          enable = true;
          defaultEditor = true;
          vimdiffAlias = true;
          extraPackages = with pkgs; [
            ripgrep
            fd 
          ];
          imports = [
            ./plugins
            ./lsp
            ./colorscheme.nix
            ./options.nix
            ./keymap.nix
          ];
        };
      };
    };
}

