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
    _1password-gui = {
      enable = true;
      package = pkgs.unstable._1password-gui;
    };
    _1password.enable = true;
  };

  system.configurationRevision = config.flake.rev or config.flake.dirtyRev or null;
  
}
