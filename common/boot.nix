{
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
    consoleMode = "max";
    configurationLimit = 10;
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.cleanTmpDir = true;
  boot.tmpOnTmpfs = true;
}
