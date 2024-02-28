{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  environment.systemPackages = with pkgs; [
    ## language servers
    bear # for generating compile_commands.json
    clang-tools # clangd for C
    elmPackages.elm-language-server
    lua-language-server
    marksman # markdown lsp
    nodePackages.bash-language-server
    nodePackages.typescript-language-server
    nodePackages.vim-language-server
    nodePackages.vue-language-server
    phpactor
    proselint # text linter
    pyright # python
    python311Packages.python-lsp-server
    ruff-lsp # python
    rust-analyzer
  ];
}
