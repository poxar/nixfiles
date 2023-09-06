{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  # boot.kernelParams = [ "radeon.si_support=0" "amdgpu.si_support=1" ];
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
    amdvlk
  ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };
}
