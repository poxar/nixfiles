{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nup = "nix flake update && sudo nixos-rebuild --upgrade boot";
      nrs = "sudo nixos-rebuild switch";
      nrb = "sudo nixos-rebuild boot";
      nxu = "nh os switch --update ~/Code/nixfiles";
      nxs = "nh os switch ~/Code/nixfiles";
      nxb = "nh os boot ~/Code/nixfiles";
      ns = "nix-shell --run fish -p";
      usenix = "echo 'use nix' >> .envrc && direnv allow";
      useflake = "echo 'use flake' >> .envrc && direnv allow";
    };
  };

  environment.systemPackages = with pkgs; [
    fishPlugins.autopair
  ];
}
