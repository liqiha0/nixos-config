{ ... }:

{
  imports = [
    ../../modules/nixos/core.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/impermanence.nix
    ../../modules/nixos/desktop.nix
    ./disko-config.nix
  ];

  hardware.microsoft-surface.kernelVersion = "stable";
  networking.hostName = "lqh-surface";

  facter.reportPath = ./facter.json;
  nixpkgs.hostPlatform = "x86_64-linux";

  services.xserver.videoDrivers = [ "modesetting" ];

  services.power-profiles-daemon.enable = true;
  services.fwupd.enable = true;
}
