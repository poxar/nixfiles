{ config, pkgs, ... }:

{
  fonts.enableDefaultFonts = true;
  fonts.fonts = with pkgs; [
    fira-code
    inconsolata
    inter
    terminus_font
    terminus_font_ttf
  ];
}
