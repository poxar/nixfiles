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
    celluloid # video player
    eyedropper # color picker
    fragments # bittorrent client
    gnome-obfuscate # censor private information in media files
    gnome-solanum # pomodoro timer
    gnome.dconf-editor # graphical dconf editor
    gnome.gnome-tweaks # some additional gnome settings
    kooha # screen recorder
    metadata-cleaner # clean metadata from media files
    pika-backup # borg backup frontend
    pinentry-gnome # gnomes pinentry implementation
    video-trimmer # simpler than raw ffmpeg sometimes
    warp # graphical wormhole implementation

    unstable.parabolic # graphical interface to yt-dlp
    unstable.tuba # mastodon client

    # make qt applications look like gnome
    adwaita-qt
    adwaita-qt6

    # gnome extensions
    gnomeExtensions.run-or-raise # mighty shortcut manager
    gnomeExtensions.appindicator # old school tray icons
    gnomeExtensions.just-perfection # tweak the visuals
    gnomeExtensions.blur-my-shell # make overview more appealing
  ];

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-tour
    gnome.cheese
    gnome.geary
    gnome.gnome-contacts
    gnome.gnome-maps
    gnome.gnome-music
    gnome.yelp
  ];
}
