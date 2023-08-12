{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    lutris
  ];
}
