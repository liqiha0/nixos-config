{ config, lib, pkgs, ... }:

{
  users.users.liqihao = {
    extraGroups = [ "video" "render" ];
  };

  hardware.graphics.enable = true;

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  virtualisation.waydroid.enable = true;

  programs.dconf.enable = true;

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
    geoclue2.enable = true;
    flatpak.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
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
