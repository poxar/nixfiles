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
    clang # for compiling treesitter grammers
    clang-tools # clangd for C
    lua-language-server
    marksman # markdown lsp
    nodePackages.typescript-language-server
    pyright # python
    python311Packages.python-lsp-server
    ruff-lsp # python
    rust-analyzer

    ## linters
    ruff # python
    mypy # python
    vim-vint # vimlang
    shellcheck # sh/bash
  ];
}
