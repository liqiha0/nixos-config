{ config, pkgs, ... }:

{
  i18n = {
    inputMethod = {
      #enabled = "fcitx5";
      #fcitx.engines = with pkgs.fcitx-engines; [ rime libpinyin ];
      #fcitx5.addons = with pkgs; [
      #  fcitx5-rime
      #  fcitx5-chinese-addons
      #  fcitx5-gtk
      #  libsForQt5.fcitx5-qt
      #];

      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ rime ];

      #enabled = "hime";
    };
  };
  environment.sessionVariables = rec {
    INPUT_METHOD  = "ibus";
  };


  services.flatpak.enable = true;

  services.xserver.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.desktopManager.pantheon.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;
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

