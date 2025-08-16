{ config, pkgs, lib, ... }:

{
  users.users.liqihao = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "video" "render" "networkmanager" ];
    shell = pkgs.fish;
    initialPassword = "123456";
    hashedPasswordFile = "/var/lib/passwords/liqihao";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHR3jqVBefqVv7SyGvRkN26XGxWHDCqw9BMUe/qCDtZD"
    ];
  };
  
  services.openssh = {
    enable = true;
  };
}
