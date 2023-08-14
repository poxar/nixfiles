{ config, pkgs, ... }:

{
  imports =
    [
      ./locale.nix
      ./input.nix
      ./sound.nix
      ./fonts.nix
      ./xdg-basedir.nix
      ./syncthing.nix

      ./gnome.nix
    ];

  boot.plymouth.enable = true;

  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.avahi.nssmdns = true;

  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    settings.PermitRootLogin = "no";
    settings.PasswordAuthentication = false;
  };

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    ## various tools
    acpi # battery status
    autossh # automatically reconnect to ssh
    dateutils # various tools for date manipulation
    ddcutil # monitor configuration
    hyperfine # benchmarking tool
    pandoc # document converter
    pwgen # password generator
    rbw # bitwarden client
    rclone # rsync for cloud services
    stress # stress testing tool
    units # unit conversion
    wl-clipboard # commandline wayland clipboard access
    youtube-dl # youtube downloader

    ## development tools
    direnv # automatic commands per directory
    entr # automatically run commands when files change
    httpie # cli http api client
    jq # cli json tool
    mitmproxy # network debugging
    mosquitto # mqtt cli tools
    picocom # serial connection terminal emulator
    shellcheck # shell linter
    tig # git tui
    tokei # sloc tool
    universal-ctags # a maintained ctags

    ## languages & tooling
    # languages I want to always have access to
    python3Full

    ## gui software
    chromium # browser
    firefox-wayland # browser
    foliate # ebook reader
    gnucash # accounting software
    inkscape # vector graphic editing
    libreoffice-fresh # documents & co
    obs-studio # streaming & video recording
    pdfarranger # merge/split/reorder pdfs
    seafile-client # file synchronisation
    spotify # music streaming
    zoom-us # videoconferencing

    ## chat software
    discord
    signal-desktop
    tdesktop
  ];
}
