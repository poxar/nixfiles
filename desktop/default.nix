{ config, pkgs, ... }:

{
  imports =
    [
      ./locale.nix
      ./input.nix
      ./sound.nix
      ./fonts.nix
      ./xdg-basedir.nix

      ./gnome.nix
      ./alacritty.nix
    ];

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
  services.fwupd.enable = true;

  programs.direnv.enable = true;

  environment.systemPackages = with pkgs; [
    ## various tools
    acpi # battery status
    autossh # automatically reconnect to ssh
    dateutils # various tools for date manipulation
    ddcutil # monitor configuration
    handlr # better default application manager
    hyperfine # benchmarking tool
    lm_sensors # read sensor values
    pandoc # document converter
    pavucontrol # audio settings
    pciutils # various programs to deal with pci hardware
    pwgen # password generator
    rbw # command line bitwarden client
    rclone # rsync for cloud services
    stress # stress testing tool
    units # unit conversion
    usbutils # various programs to deal with usb hardware
    wl-clipboard # commandline wayland clipboard access
    youtube-dl # youtube downloader

    ## development tools
    entr # automatically run commands when files change
    httpie # cli http api client
    jq # cli json tool
    lazygit # git tui
    mitmproxy # network debugging
    mosquitto # mqtt cli tools
    picocom # serial connection terminal emulator
    shellcheck # shell linter
    tig # git-log tui
    tokei # sloc tool
    universal-ctags # a maintained ctags

    ## languages & tooling
    # python
    python3Full
    # rust
    cargo
    cargo-audit
    cargo-outdated
    cargo-watch
    clang
    clippy
    gcc
    mold
    rustc
    rustfmt

    ## gui software
    firefox-wayland # browser
    foliate # ebook reader
    inkscape # vector graphic editing
    nextcloud-client # file synchronisation
    obs-studio # streaming & video recording
    pdfarranger # merge/split/reorder pdfs
    spotify # music streaming

    ## office
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_GB-large
    hunspellDicts.en_US-large
    libreoffice-fresh

    ## chat software
    discord
    signal-desktop
    tdesktop
  ];
}
