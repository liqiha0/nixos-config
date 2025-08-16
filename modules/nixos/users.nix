{ config, pkgs, lib, ... }:

{
  users.users.liqihao = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
    initialPassword = "123456";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHR3jqVBefqVv7SyGvRkN26XGxWHDCqw9BMUe/qCDtZD"
    ];
  };
  
  services.openssh = {
    enable = true;
  };
}
