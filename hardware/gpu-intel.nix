{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "i915" ];
  boot.kernelParams = [
    "i915.enable_rc6=7"
  ];

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
  ];
}
