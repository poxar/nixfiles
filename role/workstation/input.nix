{
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "altgr-intl";
  services.xserver.xkbOptions = "ctrl:nocaps";

  services.xserver.libinput.enable = true;
  services.xserver.libinput.mouse.accelProfile = "flat";
  services.xserver.libinput.touchpad.disableWhileTyping = true;

  # allow direct access to keyboard microcontrollers
  # this is needed to reflash my qmk based keyboards without having to sudo
  services.udev.extraRules = ''
    # Atmel ATMega32U4
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ff4", MODE:="0666"
    # Atmel USBKEY AT90USB1287
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ffb", MODE:="0666"
    # Atmel ATMega32U2
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2ff0", MODE:="0666"
  '';
}
