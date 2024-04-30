{ config, pkgs, ... }:

{
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
    age # modern encryption tool
    atuin # shared history forever
    bc # calculator
    bind # various network tools (dig)
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
    pistol # file previewer
    rage # another modern encryption tool
    ripgrep # opinionated grep replacement
    sd # opinionated sed replacement
    signify # modern cryptographic signatures
    skim # fuzzy finder
    sqlite # simple database
    stow # symlink farm manager
    tmux # terminal multiplexer
    tmuxPlugins.better-mouse-mode
    tmuxp # tmux session manager
    tree # show directory trees
    up # ultimate plumber - pipe visualisation
    wormhole-william # end-to-end encrypted file transfers
    zoxide # directly jump to recent directories
  ];
}
