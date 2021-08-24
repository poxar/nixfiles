{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
      (final: prev: {
        dwl = prev.dwl.overrideAttrs (old: { src = ../../src/dwl ;});
      })
  ];

  environment.systemPackages = with pkgs; [
    dwl
  ];
}
