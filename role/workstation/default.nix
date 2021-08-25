{ config, pkgs, ... }:

{
  imports =
    [
      ./locale.nix
      ./input.nix
      ./sound.nix
      ./fonts.nix
      ./gnome.nix

      ./beekeeper.nix
      ./syncthing.nix
    ];

  boot.plymouth.enable = true;

  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.openssh.enable = true;
  services.flatpak.enable = true;

  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql_13;
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
  services.mysql.bind = "127.0.0.1";

  environment.sessionVariables.TERMINAL = ["alacritty"];
  environment.systemPackages = with pkgs; [
    ## various tools
    acpi # battery status
    aria # commandline torrent client
    autossh # automatically reconnect to ssh
    dateutils # various tools for date manipulation
    ddcutil # monitor configuration
    hyperfine # benchmarking tool
    pandoc # document converter
    proselint # linter for prose
    pwgen # password generator
    rclone # rsync for cloud services
    stress # stress testing tool
    units # unit converstion
    wl-clipboard # commandline wayland clipboard access
    youtube-dl # youtube downloader

    ## development tools
    bear # automatic generation of clangd configuration
    direnv # automatic commands per directory
    entr # automatically run commands when files change
    git # vcs
    httpie # cli http api client
    jq # cli json tool
    mitmproxy # network debugging
    mosquitto # mqtt cli tools
    picocom # serial connection terminal emulator
    shellcheck # shell linter
    tig # git tui
    tokei # sloc tool
    universal-ctags # a maintained ctags
    zeal # offline documentation browser

    ## gui software
    alacritty # terminal emulator
    chromium # browser
    firefox-wayland # browser
    foliate # ebook reader
    gnucash # accounting software
    inkscape # vector graphic editing
    obs-studio # streaming & video recording
    pdfarranger # merge/split/reorder pdfs
    weechat # irc client
  ];
}
