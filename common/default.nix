{ config, pkgs, ... }:

{
  # TODO: The hardcoded path to the flake is ugly
  # It sadly is required, since this module generates a faulty command line otherwise
  # I could instead roll my own service file, sidestepping the whole issue and using
  # /etc/nixos/flake.nix as intended.
  system.autoUpgrade = {
    enable = true;
    persistent = true;
    flake = "/home/pmi/Code/nixfiles";
    flags = [
      "--recreate-lock-file"
      "-L" # print build log
    ];
  };

  imports =
    [
      ./nix.nix
      ./boot.nix
      ./user.nix
      ./fish.nix
      ./neovim.nix
    ];

  programs.git.enable = true;
  programs.git.lfs.enable = true;

  environment.systemPackages = with pkgs; [
    atuin # shared history forever
    age # modern encryption tool
    bc # calculator
    bind # various network tools (dig)
    colordiff # colorful diff
    curl # http toolchain
    fd # opinionated find replacement
    file # inspect file type
    gnumake # venerable build tool and task runner
    htop # system monitor
    iperf # measure network bandwidth
    lf # simple terminal file browser
    libarchive # provides bsdtar
    lsof # list open files and sockets
    moreutils # additional tooling
    mosh # ssh with roaming
    ncdu # disk analyzer
    nmap # port scanner
    p7zip # 7z compression
    pigz # parallel gzip
    rage # another modern encryption tool
    ripgrep # opinionated grep replacement
    sd # opinionated sed replacement
    skim # fuzzy finder
    sqlite # simple database
    stow # symlink farm manager
    tmux # terminal multiplexer
    tmuxp # tmux session manager
    tmuxPlugins.better-mouse-mode
    tree # show directory trees
    up # ultimate plumber - pipe visualisation
    wormhole-william # end-to-end encrypted file transfers
    zoxide # directly jump to recent directories
  ];
}
