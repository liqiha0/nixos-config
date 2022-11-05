{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  #services.colord.enable = true;
  #services.geoclue2.enable = true;

  #services.xserver.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.pop-shell
    gnomeExtensions.appindicator
    gnome.adwaita-icon-theme
  ];
}

