{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [
    pkgs.clang-tools
    pkgs.libinput
    pkgs.xorg.libxcb
    pkgs.libxkbcommon
    pkgs.pixman
    pkgs.wayland
    pkgs.wayland-protocols
    pkgs.wlroots
    pkgs.xorg.libX11
    pkgs.xwayland
  ];
}
