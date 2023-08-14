{ lib, config, pkgs, ... }:
with lib.hm.gvariant;
{
  programs.rbw.settings.pinentry = "gnome3";

  home.packages = with pkgs; [
    amberol # music player
    dconf2nix # convert dconf dumps to nix
    eyedropper # color picker
    gnome-solanum # pomodoro timer
    khronos # time tracker
    metadata-cleaner # clean metadata from media files
    pika-backup # borg backup frontend
    textpieces # simple text transformations
    video-trimmer # simpler than raw ffmpeg sometimes
    warp # graphical wormhole implementation

    gnomeExtensions.espresso # keep the screen alive
    gnomeExtensions.run-or-raise # mighty shortcut manager
    gnomeExtensions.tiling-assistant # manual tiling
    gnomeExtensions.transparent-top-bar-adjustable-transparency
    gnomeExtensions.appindicator # old school tray icons
  ];

  home.file.".config/tiling-assistant/layouts.json".source = ./tiling-assistant.json;
  home.file.".config/run-or-raise/shortcuts.conf".source = ./run-or-raise.conf;

  dconf.settings = {
    "io/bassi/Amberol" = {
      replay-gain = "album";
    };

    "org/gnome/TextEditor" = {
      custom-font = "Fira Code Light 11";
      restore-session = false;
      style-scheme = "Adwaita";
      use-system-font = false;
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "keyboard";
      number-format = "automatic";
      refresh-interval = 86400;
      show-thousands = true;
      show-zeroes = false;
    };

    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      enable-hot-corners = false;
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 7;
      recent-files-max-age = -1;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [
        "org.gnome.Calendar.desktop"
        "org.gnome.Characters.desktop"
        "org.gnome.clocks.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.Epiphany.desktop"
      ];
      sort-order = [
        "org.gnome.Settings.desktop"
        "org.gnome.Documents.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Photos.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Contacts.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Characters.desktop"
        "org.gnome.clocks.desktop"
        "org.gnome.seahorse.Application.desktop"
      ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };

    "org/gnome/evolution-data-server/calendar" = {
      notify-completed-tasks = false;
      notify-enable-audio = false;
      notify-enable-display = false;
      notify-window-on-top = false;
    };

    "org/gnome/gnome-system-monitor" = {
      cpu-stacked-area-chart = false;
      graph-data-points = 80;
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = true;
      show-whose-processes = "all";
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      col-12-visible = false;
      col-22-visible = false;
      col-23-visible = false;
      col-24-visible = true;
      col-25-visible = true;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "small-plus";
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "small";
      use-tree-view = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      search-view = "list-view";
      show-create-link = true;
    };

    "org/gnome/shell" = {
      enabled-extensions = [
        "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "tiling-assistant@leleat-on-github"
        "run-or-raise@edvard.cz"
        "transparent-top-bar@ftpix.com"
        "espresso@coadmunkee.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
      favorite-apps = [
        "Alacritty.desktop"
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Solanum.desktop"
        "spotify.desktop"
        "org.telegram.desktop.desktop"
        "signal-desktop.desktop"
        "discord.desktop"
        "steam.desktop"
      ];
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "spotify.desktop:3"
        "org.telegram.desktop.desktop:2"
        "signal-desktop.desktop:2"
        "steam.desktop:3"
        "discord.desktop:3"
      ];
    };

    "org/gnome/shell/extensions/tiling-assistant" = {
      activate-layout0 = [];
      activate-layout1 = [];
      activate-layout2 = [ "<Super>f" ];
      activate-layout3 = [ "<Super>apostrophe" ];
      activate-layout4 = [ "<Shift><Super>quotedbl" ];
      activate-layout5 = [];
      active-window-hint = 0;
      active-window-hint-border-size = 2;
      active-window-hint-color = "rgb(53,132,228)";
      adapt-edge-tiling-to-favorite-layout = false;
      auto-tile = [];
      center-window = [];
      debugging-free-rects = [];
      debugging-show-tiled-rects = [];
      default-move-mode = 0;
      disable-tile-groups = false;
      dynamic-keybinding-behavior = 1;
      enable-advanced-experimental-features = true;
      enable-tiling-popup = false;
      favorite-layouts = [ "2" ];
      import-layout-examples = false;
      last-version-installed = 40;
      maximize-with-gap = false;
      restore-window = [ "<Super>Down" ];
      screen-bottom-gap = 12;
      screen-left-gap = 12;
      screen-right-gap = 12;
      screen-top-gap = 12;
      search-popup-layout = [ "<Super>semicolon" ];
      show-layout-panel-indicator = false;
      single-screen-gap = 20;
      tile-bottom-half = [ "<Super>KP_2" ];
      tile-bottom-half-ignore-ta = [];
      tile-bottomleft-quarter = [ "<Super>KP_1" ];
      tile-bottomleft-quarter-ignore-ta = [];
      tile-bottomright-quarter = [ "<Super>KP_3" ];
      tile-bottomright-quarter-ignore-ta = [];
      tile-edit-mode = [];
      tile-left-half = [ "<Super>Left" "<Super>KP_4" ];
      tile-left-half-ignore-ta = [];
      tile-maximize = [ "<Super>Up" "<Super>KP_5" ];
      tile-maximize-horizontally = [];
      tile-maximize-vertically = [];
      tile-right-half = [ "<Super>Right" "<Super>KP_6" ];
      tile-right-half-ignore-ta = [];
      tile-top-half = [ "<Super>KP_8" ];
      tile-top-half-ignore-ta = [];
      tile-topleft-quarter = [ "<Super>KP_7" ];
      tile-topleft-quarter-ignore-ta = [];
      tile-topright-quarter = [ "<Super>KP_9" ];
      tile-topright-quarter-ignore-ta = [];
      toggle-always-on-top = [];
      toggle-tiling-popup = [];
      window-gap = 12;
    };

    "org/gnome/shell/extensions/espresso" = {
      enable-fullscreen = true;
      show-notifications = false;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "[<(uint32 2, <('Berlin', 'EDDT', true, [(0.91746141594945008, 0.23241968454167572)], [(0.91658875132345297, 0.23387411976724018)])>)>]";
    };

    "org/gnome/system/location" = {
      enabled = true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "system/locale" = {
      region = "de_DE.UTF-8";
    };
  };
}
