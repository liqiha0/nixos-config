{ lib, ... }:

{
  imports = [
    ../../modules/nixos/core.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/impermanence.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/shellcrash.nix
    ./disko-config.nix
  ];

  networking.hostName = "lqh-legacy-nixos";
  facter.reportPath = ./facter.json;
  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config.nvidia.acceptLicense = true;

  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    efi.canTouchEfiVariables = lib.mkForce false;
    grub = {
      enable = true;
      efiSupport = false;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    branch = "legacy_580";
    modesetting.enable = true;
    open = false;
  };

  users.users.liqihao.extraGroups = [ "docker" ];
}
