{
  description = "My system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
  let
    system = "x86_64-linux";
    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in {
    nixosConfigurations.leonis = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
        ./host/leonis
        ./hardware/cpu-amd.nix
        ./hardware/gpu-amd.nix
        ./common
        ./desktop
        ./gaming
      ];
    };
    nixosConfigurations.tauron = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
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
