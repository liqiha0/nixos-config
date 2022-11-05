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
}

