{ inputs, ... }: {
  perSystem = { pkgs, system, ... }: let
    nixvimLib = inputs.nixvim.lib.${system};
    nixvim' = inputs.nixvim.legacyPackages.${system};
    nvimModule = {
      module = import ../config;
    };
    nvim = nixvim'.makeNixvimWithModule nvimModule;
  in {
    checks = {
      default = nixvimLib.check.mkTestDerivationFromNixvimModule nvimModule;
    };
    packages.default = nvim;
  };
}
