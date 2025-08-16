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
      Telegram = 747648890;
      WeChat = 836500024;
      QQ = 451108668;
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
      { name = "clash-verge-rev"; }
      { name = "squirrel-app"; }
      { name = "moonlight"; }
    ];
  };
}
