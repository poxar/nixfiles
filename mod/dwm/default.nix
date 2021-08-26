{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        postPatch = "cp ${./config.h} config.def.h";
        patches = old.patches ++ [
          (prev.fetchpatch {
            url = "https://dwm.suckless.org/patches/pertag/dwm-pertag-6.2.diff";
            sha256 = "042bp41sn8dvjkxnw1bclc268ik6g7cg5qalvx89xpmz5pqs0p85";
          })
          (prev.fetchpatch {
            url = "https://dwm.suckless.org/patches/movestack/dwm-movestack-6.1.diff";
            sha256 = "0wwdzzwl7m08hsimfh8dam1k0lg87q5ca6c8nznk79x6wvlg4rgz";
          })
          (prev.fetchpatch {
            url = "https://dwm.suckless.org/patches/center/dwm-center-6.2.diff";
            sha256 = "03m6lzlzann5h72krzy8a41f0r1syrdvkqwkga2fiw3bggifw0fi";
          })
          (prev.fetchpatch {
            url = "https://dwm.suckless.org/patches/restartsig/dwm-restartsig-20180523-6.2.diff";
            sha256 = "0s9gfimv3m233bc9iw8w0j0ma0qank3zxffx5630qasmv90jyky7";
          })
          (prev.fetchpatch {
            url = "https://dwm.suckless.org/patches/attachbelow/dwm-attachbelow-6.2.diff";
            sha256 = "19ixa1mcsm21pfsfrg2zxg1f6rw01n23g9qla2zridvhhgrlifi7";
          })
          ./dwm-vanitygaps-6.2.diff
        ];
      });
    })
  ];

  services.xserver.windowManager.dwm.enable = true;
  programs.xss-lock.enable = true;
  programs.xss-lock.lockerCommand = "${pkgs.slock}/bin/slock";
  programs.slock.enable = true;

  environment.systemPackages = with pkgs; [
    nitrogen
    rofi
    rofi-emoji
  ];
}
