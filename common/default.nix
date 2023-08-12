{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  programs.command-not-found.enable = true;

  programs.git.enable = true;
  programs.git.lfs.enable = true;

  imports =
    [
      ./nix.nix
      ./boot.nix
      ./user.nix
      ./fish.nix
      ./neovim.nix
    ];

  environment.systemPackages = with pkgs; [
    age # modern encryption tool
    bc # calculator
    bind # various network tools (dig)
    colordiff # colorful diff
    curl # http toolchain
    fd # opinionated find replacement
    file # inspect file type
    htop # system monitor
    iperf # measure network bandwidth
    libarchive # provides bsdtar
    lsof # list open files and sockets
    moreutils # additional tooling
    mosh # ssh with roaming
    ncdu # disk analyzer
    nmap # port scanner
    p7zip # 7z compression
    pigz # parallel gzip
    ripgrep # opinionated grep replacement
    sd # opinionated sed replacement
    skim # fuzzy finder
    sqlite # simple database
    stow # symlink farm manager
    tmux # terminal multiplexer
    tmuxp # tmux session manager
    tree # show directory trees
    up # ultimate plumber - pipe visualisation
    wormhole-william # end-to-end encrypted file transfers
    zoxide # directly jump to recent directories
  ];
}
