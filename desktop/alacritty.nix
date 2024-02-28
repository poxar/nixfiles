{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # force alacritty into xwayland to fix various issues with gnome/wayland
    (unstable.alacritty.overrideAttrs ( finalAttrs: previousAttrs: {
      cargoBuildNoDefaultFeatures = true;
      cargoBuildFeatures = [ "x11" ];
    }))
    # we need xclip to support copy paste in xwayland
    xclip
  ];
}
