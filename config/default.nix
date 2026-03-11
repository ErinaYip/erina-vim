{
  imports = [
    ./lspconfig
    ./lsp
    ./editor
    ./ui
    ./dap
    ./misc
    ./git
    ./snacks
    ./mini

    ./colorscheme.nix
    ./options.nix
    ./keymap.nix
  ];

  plugins.lz-n.enable = true;
}
