{
  cmd = [ "astro-ls" "--stdio" ];
  filetypes = [ "astro" ];
  root_markers = [
    "package.json"
    "tsconfig.json"
    "jsconfig.json"
  ];
  init_options = {
    typescript = [ ];
  };
 }
