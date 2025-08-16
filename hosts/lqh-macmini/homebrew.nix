{ ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
      extraFlags = [
        "--force-cleanup"
      ];
    };
    taps = [
      { name = "liqiha0/versions"; }
      { name = "PlayCover/playcover"; }
      { name = "antoniorodr/memo"; }
      { name = "steipete/tap"; }
    ];
    masApps = {
      Telegram = 747648890;
      Dropover = 1355679052;
      QQ = 451108668;
      WeChat = 836500024;
      "Spark Desktop" = 6445813049;
      "Draw Things" = 6444050820;
      "Windows App" = 1295203466;
      Xcode = 497799835;
      "Numbers表格" = 361304891;
      "Pages文稿" = 361309726;
      "Keynote讲演" = 361285480;
    };
    brews = [
      { name = "mas"; }
      { name = "liqiha0/versions/ta-lib@0.4"; }
      { name = "duti"; }
      { name = "cocoapods"; }
      { name = "antoniorodr/memo/memo"; }
      { name = "steipete/tap/remindctl"; }
      { name = "steipete/tap/peekaboo"; }
    ];
    greedyCasks = true;
    casks = [
      { name = "obsidian"; }
      { name = "zen"; }
      { name = "contexts"; }
      { name = "istat-menus"; }
      { name = "orbstack"; }
      { name = "1password"; }
      { name = "PlayCover/playcover/playcover-community"; }
      { name = "parsec"; }
      { name = "appcleaner"; }
      { name = "iina"; }
      { name = "switchhosts"; }
      { name = "chatgpt"; }
      { name = "steam"; }
      { name = "clash-verge-rev"; }
      { name = "balenaetcher"; }
      { name = "squirrel-app"; }
      { name = "google-chrome"; }
      { name = "warp"; }
      { name = "betterdisplay"; }
      { name = "linearmouse"; }
      { name = "heroic"; }
      { name = "utm"; }
      { name = "stability-matrix"; }
      { name = "typeless"; }

      { name = "zulu@8"; }
      { name = "android-platform-tools"; }
      { name = "android-commandlinetools"; }

      { name = "leigod"; }
      { name = "hbuilderx"; }
      { name = "wechatwebdevtools"; }
      { name = "awesun"; }
      { name = "league-of-legends"; }
    ];
  };
}
