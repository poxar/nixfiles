{ config, pkgs, ... }:

{
  nixpkgs.config.joypixels.acceptLicense = true;

  fonts.enableDefaultFonts = true;
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; } )
    fira-code
    inconsolata
    inter
    joypixels
    noto-fonts
    noto-fonts-cjk
  ];
}
