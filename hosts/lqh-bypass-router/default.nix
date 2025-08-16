{ lib, pkgs, ... }:

{
  imports = [
    ../../modules/nixos/core.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/impermanence.nix
    ../../modules/nixos/users.nix
    ./disko-config.nix
  ];

  networking.hostName = "lqh-bypass-router";
  nixpkgs.hostPlatform = "x86_64-linux";
  networking.useDHCP = lib.mkDefault true;
  facter.reportPath = ./facter.json;

  services.qemuGuest.enable = true;

  boot.initrd.availableKernelModules = [
    "ahci"
    "virtio_blk"
    "virtio_net"
    "virtio_pci"
    "virtio_scsi"
    "xhci_pci"
    "sr_mod"
  ];

  system.stateVersion = "25.11";
}
