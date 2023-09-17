{
  programs.command-not-found.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # keep shell.nix derivations
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
