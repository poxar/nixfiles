{ config, pkgs, ... }:

{
  system.stateVersion = "23.05";

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
  security.pam.enableFscrypt = true;

  imports =
    [
      ./hardware-configuration.nix
    ];
}
