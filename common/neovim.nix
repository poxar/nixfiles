{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  environment.systemPackages = with pkgs; [
    # c family
    bear
    clang
    clang-tools

    # html/css/js/ts
    nodePackages.prettier
    nodePackages.typescript-language-server
    vscode-langservers-extracted

    # rust
    rust-analyzer

    # python
    mypy
    ruff
    ruff-lsp

    # sh/bash
    nodePackages.bash-language-server
    shellcheck
    shfmt

    # neovim
    lua-language-server
    vim-vint

    # markdown
    marksman

    # language/spelling
    nodePackages.alex
  ];
}
