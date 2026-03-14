{ pkgs, ... }: {
  #pnpm install @mdx-js/language-server
  cmd = [ "pnpm" "mdx-language-server" "--stdio" ];
  filetypes = [ "mdx" ];
  root_markers = [ "package.json" ];
  settings = {};
  init_options.typescript.tsdk = "${pkgs.typescript}/lib";
}
