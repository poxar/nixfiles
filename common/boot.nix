{
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
    consoleMode = "max";
    configurationLimit = 10;
  };

  boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;
  boot.tmp.useTmpfs = true;
}
