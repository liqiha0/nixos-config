{ config, pkgs, ... }:

{
  imports = [
    ../common/unfree.nix
  ];

  services.tailscale.enable = true;

  nix = {
    settings = {
    trusted-users = [ "liqihao" ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    optimise.automatic = true;
  };
}
