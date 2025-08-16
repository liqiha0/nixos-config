{ config, pkgs, ... }:

{
  hardware.graphics.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  virtualisation.waydroid.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "uwsm start hyprland";
        user = "liqihao";
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
        user = "greeter";
      };
    };
  };

  programs = {
    hyprland = {
      enable = true;
      package = pkgs.unstable.hyprland;
      withUWSM = true;
    };
    niri = {
      enable = true;
      package = pkgs.unstable.niri;
    };
    _1password-gui = {
      enable = true;
      package = pkgs.unstable._1password-gui;
      polkitPolicyOwners = [ "liqihao" ];
    };
    _1password.enable = true;
  };

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        zen
        .zen-wrapped
      '';
      mode = "0755";
    };
  };
}
