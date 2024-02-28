{ config, pkgs, ... }:

{
  system.stateVersion = "23.11";

  networking.hostName = "tauron";
  services.fstrim.enable = true;

  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited=yes
    HandleLidSwitch=suspend-then-hibernate
    HandleLidSwitchExternalPower=suspend-then-hibernate
  '';

  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main = {
        capslock = "overload(control, esc)";
	space = "overload(symbols, space)";
      };
      "symbols" = {
        h = "left";
        j = "down";
        k = "up";
        l = "right";

	p = "pageup";
	n = "pagedown";

	a = "home";
	e = "end";

        s = "macro(M-right 10ms A-tab 10ms M-left 10ms A-tab)";
      };
    };
  };

  imports =
    [
      ./hardware-configuration.nix
    ];
}
