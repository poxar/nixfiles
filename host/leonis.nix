{ config, pkgs, ... }:

{
  networking.hostName = "leonis";
  nix.nrBuildUsers = 64;

  # services.xserver.monitorSection = ''
  #   DisplaySize 
  # '';
  services.xserver.dpi = 192;
  environment.variables.XCURSOR_SIZE = "32";

  imports =
    [
      ../common
      ../hardware/amd/cpu.nix
      ../hardware/amd/gpu.nix
      ../hardware/ssd.nix
      ../role/workstation
    ];
}
