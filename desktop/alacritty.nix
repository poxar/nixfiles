{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    # we need xclip to support copy paste in xwayland
    xclip
  ];

  # force alacritty into xwayland to fix various issues with gnome/wayland
  environment.variables = {
    WINIT_UNIX_BACKEND = "x11";
  };
}
