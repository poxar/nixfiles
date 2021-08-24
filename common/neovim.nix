{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
  vi-wrapper = pkgs.writeShellScriptBin "vi" ''nvim "$@"'';
  vim-wrapper = pkgs.writeShellScriptBin "vim" ''nvim "$@"'';
  vimdiff-wrapper = pkgs.writeShellScriptBin "vimdiff" ''nvim -d "$@"'';
in {
  environment.sessionVariables.EDITOR = ["nvim"];
  environment.systemPackages = with pkgs; [
    vi-wrapper
    vim-wrapper
    vimdiff-wrapper
    unstable.neovim
  ];
}
