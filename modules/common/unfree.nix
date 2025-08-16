{ lib, pkgs, ... }:

let
  getName = x: if builtins.isString x then x else lib.getName x;

  allowedUnfree = map getName [
    pkgs._1password-gui
    pkgs._1password-cli
    pkgs.steam
    pkgs.steam-unwrapped
    "nvidia-x11"
    "nvidia-settings"
  ];
in
{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) allowedUnfree;
}
