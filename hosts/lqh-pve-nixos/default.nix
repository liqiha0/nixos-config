{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ../../modules/nixos/core.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/impermanence.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/gaming.nix
    ./disko-config.nix
  ];

  networking.hostName = "lqh-pve-nixos";

  facter.reportPath = ./facter.json;
  nixpkgs.hostPlatform = "x86_64-linux";

  services.qemuGuest.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
  };

  fileSystems."/mnt/workspace" = {
    device = "10.0.0.2:/volume1/workspace";
    fsType = "nfs4";
  };

  services = {
    sunshine = {
      enable = true;
      capSysAdmin = true;
      openFirewall = true;
      package = pkgs.unstable.sunshine;
    };
  };
}
