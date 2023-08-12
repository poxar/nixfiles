{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  # needed for espanso-wayland
  users.users.pmi.extraGroups = [ "input" ];

  environment.systemPackages = with pkgs; [
    amberol # music player
    emote # emoji picker
    espanso-wayland # global text expansion
    gnome-solanum # pomodoro timer
    gnome.gnome-tweaks # some additional gnome settings
    gnomeExtensions.espresso # keep the screen alive
    gnomeExtensions.run-or-raise # mighty shortcut manager
    gnomeExtensions.tiling-assistant # manual tiling
    pika-backup # borg backup frontend
    pinentry-gnome # only here explictily for rbw
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-music
  ];
}
