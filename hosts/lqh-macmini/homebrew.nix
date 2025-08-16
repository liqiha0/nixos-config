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
      { name = "lbjlaq/antigravity-manager"; }
    ];
    brews = [
      { name = "openjdk"; }
      { name = "openjdk@21"; }
      { name = "liqiha0/versions/ta-lib@0.4"; }
      { name = "duti"; }
      { name = "screenpipe"; }
      { name = "tw93/tap/mole"; }
    ];
    greedyCasks = true;
    casks = [
      { name = "zulu@8"; }
      { name = "zulu@11"; }
      { name = "graalvm-jdk@25"; }
      { name = "android-platform-tools"; }
      { name = "android-commandlinetools"; }

      { name = "vivaldi"; }
      { name = "zen"; }
      { name = "contexts"; }
      { name = "istat-menus"; }
      { name = "orbstack"; }
      # { name = "PlayCover/playcover/playcover-community"; }
      # { name = "PlayCover/playcover/sideloadly"; }
      # { name = "altserver"; }
      { name = "parsec"; }
      { name = "obsidian"; }
      { name = "appcleaner"; }
      # { name = "utm"; }
      { name = "iina"; }
      { name = "godot"; }
      { name = "switchhosts"; }
      # { name = "chatgpt"; }
      { name = "codex-app"; }
      { name = "jordanbaird-ice"; }
      { name = "stability-matrix"; }
      { name = "steam"; }
      { name = "sony-ps-remote-play"; }
      { name = "clash-party"; }
      { name = "mythic"; }
      { name = "balenaetcher"; }
      { name = "squirrel-app"; }
      { name = "syncthing-app"; }

      { name = "hbuilderx"; }
      { name = "wechatwebdevtools"; }
      { name = "vnc-viewer"; }
      { name = "apifox"; }

      { name = "heroic"; }
      { name = "lbjlaq/antigravity-manager/antigravity-tools"; }
    ];
  };
}

