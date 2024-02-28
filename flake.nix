{
  description = "My system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.leonis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./host/leonis
        ./hardware/cpu-amd.nix
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
        ./hardware/cpu-intel.nix
        ./hardware/gpu-intel.nix
        ./hardware/gpu-nvidia-disable.nix
        ./common
        ./desktop
      ];
    };
  };
}
