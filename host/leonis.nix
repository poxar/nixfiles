{ config, pkgs, ... }:

{
  networking.hostName = "leonis";
  security.pam.enableFscrypt = true;
  nix.nrBuildUsers = 64;

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowSuspendThenHibernate=no
    AllowHybridSleep=no
  '';

  imports =
    [
      ../common
      ../hardware/amd/cpu.nix
      ../hardware/amd/gpu.nix
      ../hardware/ssd.nix
      ../role/workstation
    ];
}
