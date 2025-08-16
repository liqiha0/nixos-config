{ config, pkgs, ... }:

{
  imports = [
    ../common/unfree.nix
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    optimise.automatic = true;
  };
}
