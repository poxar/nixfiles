{ config, pkgs, ... }:

{
  xdg.portal.enable = true;
  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.useGlamor = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.audio-output-switcher
    gnomeExtensions.noannoyance
    gnomeExtensions.run-or-raise
    gnomeExtensions.tiling-assistant
    gnomeExtensions.syncthing-indicator
  ];
}
