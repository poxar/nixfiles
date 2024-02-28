{ config, pkgs, ... }:

{
  nixpkgs.config.joypixels.acceptLicense = true;

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; } )
      corefonts # microsoft core fonts
      fira-code
      inconsolata
      inter
      joypixels
      noto-fonts
      noto-fonts-cjk
      vistafonts # more microsoft fonts
    ];

    fontconfig.localConf = ''
      <fontconfig>
        <match target="font">
          <test name="family" compare="eq" ignore-blanks="true">
            <string>FiraCode</string>
          </test>
          <test name="family" compare="eq" ignore-blanks="true">
            <string>FiraCode Nerd Font</string>
          </test>
          <test name="family" compare="eq" ignore-blanks="true">
            <string>Fira Code</string>
          </test>
          <edit name="fontfeatures" mode="append">
            <string>cv06 on</string>
            <string>ss02 on</string>
            <string>ss03 on</string>
            <string>ss04 on</string>
            <string>ss05 on</string>
            <string>ss08 on</string>
            <string>onum on</string>
          </edit>
        </match>
      </fontconfig>
    '';
  };
}
