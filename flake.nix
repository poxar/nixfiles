{
  description = "My system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.leonis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./host/leonis
        ./hardware/gpu-amd.nix
        ./common
        ./desktop
        ./gaming
      ];
    };
    nixosConfigurations.tauron = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./host/tauron
        ./hardware/gpu-intel.nix
        ./hardware/gpu-nvidia-disable.nix
        ./common
        ./desktop
      ];
    };
  };
}
