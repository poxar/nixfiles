{ config, pkgs, ... }:

{
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  # mouse configuration
  services.ratbagd.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    piper # mouse configuration
  ];
}
