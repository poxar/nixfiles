{ config, pkgs, ... }:

{
  programs.rbw = {
    enable = true;
    settings.email = "philipp.millar@poxar.net";
  };
}
