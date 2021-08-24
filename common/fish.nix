{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nup = "sudo nix-channel --update && sudo nixos-rebuild --upgrade boot";
      nrs = "sudo nixos-rebuild switch";
      nrb = "sudo nixos-rebuild boot";
      ned = "sudoedit /etc/nixos/configuration.nix";
      gcr = "nix-instantiate shell.nix --indirect --add-root .shell.drv";
      usenix = "echo 'use nix' >> .envrc && direnv allow";
    };
  };
}
