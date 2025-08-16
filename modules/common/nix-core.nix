{ config, pkgs, ... }:

{
  imports = [
    ../common/unfree.nix
  ];

  services.tailscale.enable = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    optimise.automatic = true;
  };
}
