{ config, pkgs, ... }:

{
  networking.hostName = "tauron";

  services.fstrim.enable = true;
  security.pam.enableFscrypt = true;

  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited=yes
    HandleLidSwitch=suspend-then-hibernate
    HandleLidSwitchExternalPower=suspend-then-hibernate
  '';

  services.keyd = {
    enable = true;
    settings = {
      main = {
        capslock = "overload(control, esc)";
        leftalt = "layer(leftalt)";
        leftmeta = "layer(leftmeta)";
      };
      "leftalt:A" = {
        h = "left";
        j = "down";
        k = "up";
        l = "right";
      };
      "leftmeta:M" = {
        h = "home";
        j = "pagedown";
        k = "pageup";
        l = "end";
        s = "macro(M-right 10ms A-tab 10ms M-left 10ms A-tab)";
      };
    };
  };

  imports =
    [
      ./hardware-configuration.nix
    ];
}
