{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.useGlamor = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Fixes alacritty display
  environment.sessionVariables.WINIT_UNIX_BACKEND = "x11";

  environment.systemPackages = with pkgs; [
    gcolor3
    gnome.gnome-tweaks
    gnomeExtensions.audio-output-switcher
    gnomeExtensions.espresso
    gnomeExtensions.just-perfection
    gnomeExtensions.run-or-raise
    gnomeExtensions.syncthing-indicator
    gnomeExtensions.tiling-assistant
  ];
}
