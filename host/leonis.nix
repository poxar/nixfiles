{ config, pkgs, ... }:

{
  networking.hostName = "leonis";
  nix.nrBuildUsers = 64;

  imports =
    [
      ../common
      ../hardware/amd/cpu.nix
      ../hardware/amd/gpu.nix
      ../hardware/ssd.nix
      ../role/workstation
    ];
}
