{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
in {
  services.xserver = {
    enable = true;
    autorun = true;

    excludePackages = [ pkgs.xterm ];
    displayManager = {
      gdm.enable = true;
      gdm.wayland = true;
    };
  };

  programs.hyprland = {
    package = unstable.hyprland;
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  environment.systemPackages = with pkgs; [
    # (waybar.overrideAttrs (oldAttrs: {
    #   mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    # }))
    hyprland-share-picker
    xdg-desktop-portal-hyprland
    hyprpaper
    dunst
    wofi
    rofi-wayland
  ];
}
