{ config, pkgs, lib, ... }:

{
  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=25%" "mode=755" ];
  };

  fileSystems."/persist".neededForBoot = true;

  systemd.tmpfiles.rules = [
    "d /persist/home/liqihao 0700 liqihao users -"
  ];

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/home"
      "/var/lib"
      "/var/log"
      "/tmp"
    ];
    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
  };
}
