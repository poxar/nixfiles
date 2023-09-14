{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;

  # we need xclip to support copy paste in xwayland
  home.packages = with pkgs; [ xclip ];

  # force alacritty into xwayland to fix several issues
  xdg.desktopEntries.Alacritty = {
    type = "Application";
    exec = "env -u WAYLAND_DISPLAY alacritty";
    icon = "Alacritty";
    terminal = false;
    categories = ["System" "TerminalEmulator"];

    name = "Alacritty";
    genericName = "Terminal";
    comment = "A fast, cross-platform, OpenGL terminal emulator";

    actions = {
      "New" = {
        name = "New Terminal";
        exec = "env -u WAYLAND_DISPLAY alacritty";
      };
    };
  };

  # included raw, so alacritty errors make sense
  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
}
