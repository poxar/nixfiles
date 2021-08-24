{ config, pkgs, ... }:

{
  networking.hostName = "tauron";

  # This somehow didn't get picked up by the hardware scan...
  boot.initrd.luks.devices.crypt = {
    device = "/dev/disk/by-uuid/10d8e50f-2b95-499a-92d8-bdb8de83e8c6";
    preLVM = true;
    allowDiscards = true;
  };

  imports =
    [
      ../common
      ../hardware/intel/cpu.nix
      ../hardware/intel/gpu.nix
      ../hardware/nvidia/disable.nix
      ../hardware/ssd.nix
      ../role/workstation
    ];
}
