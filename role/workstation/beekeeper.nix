{ config, pkgs, ... }:

let
  beekeeper = pkgs.appimageTools.wrapType2 { 
    name = "beekeeper-studio";
    src = pkgs.fetchurl {
      url = "https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v1.13.2/Beekeeper-Studio-1.13.2.AppImage";
      sha256 = "1m23d6n05pff259h4mabk5k86k2cdlyqcw0qzvl8qi8imgqaa7fk";
    };
  };
in
{
  environment.systemPackages = [ beekeeper ];
}
