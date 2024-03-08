{ config, pkgs, ... }:

{
  system.stateVersion = "23.11";

  networking.hostName = "leonis";
  nix.nrBuildUsers = 64;

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowSuspendThenHibernate=no
    AllowHybridSleep=no
  '';

  hardware.cpu.amd.updateMicrocode = true;
  services.fstrim.enable = true;

  services.xserver.displayManager.gdm.autoSuspend = false;

  imports =
    [
      ./hardware-configuration.nix
    ];
}
