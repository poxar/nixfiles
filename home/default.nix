{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
  };

  home-manager.users.pmi = {
    home.stateVersion = "23.05";

    programs.home-manager.enable = true;

    imports = [
      ./alacritty
      ./rbw.nix
      ./gnome
    ];
  };
}
