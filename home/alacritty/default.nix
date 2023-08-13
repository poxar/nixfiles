{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;

  # included raw, so alacritty errors make sense
  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
}
