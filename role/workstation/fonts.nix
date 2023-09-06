{ config, pkgs, ... }:

{
  nixpkgs.config.joypixels.acceptLicense = true;

  fonts = {
    enableDefaultFonts = true;

    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; } )
      fira-code
      inconsolata
      inter
      joypixels
      noto-fonts
      noto-fonts-cjk
    ];

    fontconfig.localConf = ''
      <fontconfig>
        <match target="font">
          <test name="family" compare="eq" ignore-blanks="true">
            <string>FiraCode</string>
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
