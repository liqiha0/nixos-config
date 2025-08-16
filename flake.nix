{
  description = "NixOS and nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arion = {
      url = "github:hercules-ci/arion";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
    nixos-facter-modules.url = "github:nix-community/nixos-facter-modules";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    hermes-agent.url = "github:NousResearch/hermes-agent/v2026.8.31";
    hermes-webui.url = "github:nesquena/hermes-webui";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      ...
    }:
    {
      darwinConfigurations."LQH-Macmini" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
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

      darwinConfigurations."baolanguodexiaoxiannvdeMacBook-Air" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/baolanguodexiaoxiannvdeMacBook-Air/default.nix
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
          inputs.arion.nixosModules.arion
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

      nixosConfigurations."lqh-nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/lqh-nixos/default.nix
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.nixos-facter-modules.nixosModules.facter
          inputs.arion.nixosModules.arion
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

      nixosConfigurations."lqh-legacy-nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/lqh-legacy-nixos/default.nix
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.nixos-facter-modules.nixosModules.facter
          inputs.arion.nixosModules.arion
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
          inputs.arion.nixosModules.arion
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

      nixosConfigurations."lqh-router" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/lqh-router/default.nix
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.nixos-facter-modules.nixosModules.facter
          inputs.arion.nixosModules.arion
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
