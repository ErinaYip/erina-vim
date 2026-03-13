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

    ./autocmd.nix
    ./colorscheme.nix
    ./options.nix
    ./keymap.nix
  ];

  plugins.lz-n.enable = true;
}
