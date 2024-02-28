{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    autorun = true;

    excludePackages = [ pkgs.xterm ];
    desktopManager.gnome.enable = true;

    displayManager = {
      gdm.enable = true;
      gdm.wayland = true;
    };
  };

  environment.variables = {
    XCURSOR_SIZE = "42";
    QT_STYLE_OVERRIDE = "adwaita";
  };

  environment.systemPackages = with pkgs; [
    amberol # music player
    eyedropper # color picker
    gnome-solanum # pomodoro timer
    gnome.dconf-editor # graphical dconf editor
    gnome.gnome-tweaks # some additional gnome settings
    khronos # time tracker
    metadata-cleaner # clean metadata from media files
    pika-backup # borg backup frontend
    video-trimmer # simpler than raw ffmpeg sometimes
    warp # graphical wormhole implementation
    pinentry-gnome # gnomes pinentry implementation

    # make qt applications look like gnome
    adwaita-qt
    adwaita-qt6

    # gnome extensions
    gnomeExtensions.espresso # keep the screen alive
    gnomeExtensions.run-or-raise # mighty shortcut manager
    gnomeExtensions.tiling-assistant # manual tiling
    gnomeExtensions.appindicator # old school tray icons
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome.gnome-music
  ];
}
