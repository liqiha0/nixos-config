{ config, pkgs, ... }:

{

  virtualisation = {
    waydroid.enable = true;
    lxd.enable = true;
  };

  programs.adb.enable = true;
}

