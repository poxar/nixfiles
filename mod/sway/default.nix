{ config, pkgs, ... }:

{
  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
  programs.sway.extraPackages = with pkgs; [ swaylock swayidle rofi wlsunset ];

  # TODO: doesn't really work yet...
  # Alternatives include wlsunset and gammastep
  # services.clight.enable = true;
  # TODO: needs to move somewhere else I think
  # location.provider = "manual";
  # location.latitude = 52.5;
  # location.longitude = 13.4;
}
