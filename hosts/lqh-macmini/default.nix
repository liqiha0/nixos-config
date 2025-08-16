{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common/nix-core.nix
    ./homebrew.nix
  ];

  environment.systemPackages = [
    pkgs.chezmoi
    pkgs.home-manager
  ];

  system.stateVersion = 6;

  system.primaryUser = "liqihao";

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;
      persistent-apps = [];
    };

    CustomUserPreferences = {
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          "70".enabled = false;
          "79".enabled = false;
          "81".enabled = false;
        };
      };
    };
  };

  # 系统设置 → 能耗
  power = {
    # 显示器关闭时，防止自动进入睡眠
    sleep.computer = "never";
    # 接入电源时启动：断电后
    restartAfterPowerFailure = true;
  };

  users.knownUsers = [ "liqihao" ];
  users.users."liqihao" = {
    uid = 501;
    shell = pkgs.fish;
  };

  programs = {
    fish =  { 
      enable = true;
    };
    _1password.enable = true;
  };

  system.configurationRevision = config.flake.rev or config.flake.dirtyRev or null;
}
