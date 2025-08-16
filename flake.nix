{
  description = "NixOS and nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-legacy.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nixpkgs-legacy,
      ...
    }:
    {
      darwinConfigurations."LQH-Macmini" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/lqh-macmini/default.nix
          (
            { config, pkgs, ... }:
            {
              nixpkgs.overlays = [
                (final: prev: {
                  unstable = import inputs.nixpkgs-unstable {
                    system = prev.stdenv.hostPlatform.system;
                    config = config.nixpkgs.config;
                  };
                })
              ];
            }
          )
        ];
      };

      nixosConfigurations."lqh-pve-nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/lqh-pve-nixos/default.nix
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.nixos-facter-modules.nixosModules.facter
          (
            { config, pkgs, ... }:
            {
              nixpkgs.overlays = [
                (final: prev: {
                  unstable = import inputs.nixpkgs-unstable {
                    system = prev.stdenv.hostPlatform.system;
                    config = config.nixpkgs.config;
                  };
                })
              ];
            }
          )
        ];
      };

      nixosConfigurations."lqh-surface" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/lqh-surface/default.nix
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
          inputs.nixos-facter-modules.nixosModules.facter
          (
            { config, pkgs, ... }:
            {
              nixpkgs.overlays = [
                (final: prev: {
                  unstable = import inputs.nixpkgs-unstable {
                    system = prev.stdenv.hostPlatform.system;
                    config = config.nixpkgs.config;
                  };
                })
              ];
            }
          )
        ];
      };
    };
}
