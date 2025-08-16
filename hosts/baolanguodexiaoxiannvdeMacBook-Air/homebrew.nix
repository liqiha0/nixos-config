{ config, pkgs, ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    masApps = {
      WeChat = 836500024;
      Dropover = 1355679052;
      "Spark Desktop" = 6445813049;
      "Windows App" = 1295203466;
    };
    brews = [
      { name = "mas"; }
      { name = "duti"; }
    ];
    greedyCasks = true;
    casks = [
      { name = "zen"; }
      { name = "1password"; }
      { name = "steam"; }
      { name = "clash-party"; }
      { name = "squirrel-app"; }
      { name = "moonlight"; }
    ];
  };
}
