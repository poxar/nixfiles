{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    emote
    gnome-solanum
    gnome.gnome-tweaks
    gnomeExtensions.espresso
    gnomeExtensions.run-or-raise
    gnomeExtensions.tiling-assistant
    pinentry-gnome
  ];
}
