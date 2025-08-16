{ config, pkgs, ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    taps = [
    ];
    masApps = {
      WeChat = 836500024;
      Dropover = 1355679052;
      "Spark Desktop" = 6445813049;
      "Draw Things: Offline AI Art" = 6444050820;
      Xcode = 497799835;
    };
    brews = [
      { name = "mas"; }
      { name = "openjdk"; }
      { name = "openjdk@17"; }
      { name = "liqiha0/versions/ta-lib@0.4"; }
      { name = "duti"; }
      { name = "tw93/tap/mole"; }
      {
        name = "ollama";
        start_service = true;
      }
    ];
    greedyCasks = true;
    casks = [
      { name = "zulu@8"; }
      { name = "zulu@11"; }
      { name = "graalvm-jdk@25"; }
      { name = "android-platform-tools"; }
      { name = "android-commandlinetools"; }

      { name = "zen"; }
      { name = "contexts"; }
      { name = "istat-menus"; }
      { name = "orbstack"; }
      # { name = "PlayCover/playcover/playcover-community"; }
      # { name = "PlayCover/playcover/sideloadly"; }
      # { name = "altserver"; }
      { name = "parsec"; }
      { name = "appcleaner"; }
      { name = "iina"; }
      { name = "switchhosts"; }
      { name = "codex-app"; }
      { name = "steam"; }
      { name = "sony-ps-remote-play"; }
      { name = "clash-party"; }
      { name = "mythic"; }
      { name = "balenaetcher"; }
      { name = "squirrel-app"; }
      { name = "ungoogled-chromium"; }

      { name = "hbuilderx"; }
      { name = "wechatwebdevtools"; }
      { name = "vnc-viewer"; }
      { name = "figma"; }

      { name = "heroic"; }
    ];
  };
}
