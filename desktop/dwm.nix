{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    autorun = true;
    dpi = 192;

    displayManager = {
      # startx.enable = true;
      defaultSession = "none+dwm";
      lightdm.greeters.slick.enable = true;
      sessionCommands = ''
        alacritty &
        firefox &
      '';
    };

    excludePackages = [ pkgs.xterm ];

    windowManager.dwm.enable = true;

    # config = (lib.mkAfter ''
    #   Section "Monitor"
    #     Identifier "DisplayPort-1"
    #     DisplaySize 596 335
    #   EndSection
    # '');

    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };
  };

  services.picom.enable = true;

  environment.variables = {
    XCURSOR_SIZE = "42";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_ENABLE_HIGHDPI_SCALING = "1";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ./../../../dwm;
  };

  environment.systemPackages = with pkgs; [
    dmenu
  ];
}
