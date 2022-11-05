{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.colord.enable = true;
  services.geoclue2.enable = true;

  services.xserver.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    libsForQt5.ark
    libsForQt5.discover
  ];

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      sarasa-gothic
    ];
  };
}

