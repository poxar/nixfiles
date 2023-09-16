{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.leonis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        /etc/nixos/hardware-configuration.nix
        ./host/leonis.nix
      ];
    };
  };
}
