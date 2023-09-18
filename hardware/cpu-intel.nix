{ config, pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelParams = [ "intel_pstate=active" ];
  boot.kernelModules = [ "kvm-intel" ];
}
