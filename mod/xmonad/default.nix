{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.autorun = true;

  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.windowManager.xmonad.enableContribAndExtras = true;

  services.xserver.windowManager.xmonad.config = ./xmonad.hs;
}
