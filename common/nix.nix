{
  nix.settings.auto-optimise-store = true;

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
