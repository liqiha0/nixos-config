{ config, pkgs, lib, ... }:

{
  imports = [
    ../common/nix-core.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  services = {
    fstrim.enable = true;
    timesyncd.enable = true;
  };

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";

  environment.systemPackages = with pkgs; [
    git
    chezmoi
    home-manager
    vim
    wget
    curl
  ];
  
  programs.fish.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "25.11";
}
