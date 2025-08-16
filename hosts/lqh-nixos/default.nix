{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/nixos/core.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/impermanence.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/shellcrash.nix
    ./disko-config.nix
  ];
  networking = {

    hostName = "lqh-nixos";
    networkmanager.ensureProfiles.profiles.lan = {
      connection = {
        id = "lan";
        type = "ethernet";
        interface-name = "enp3s0";
        autoconnect = true;
      };
      ipv4 = {
        method = "manual";
        addresses = "10.0.0.3/24";
        gateway = "10.0.0.1";
        dns = "10.0.0.1;";
        dns-search = "";
      };
      ipv6.method = "auto";
    };
    useDHCP = false;
    dhcpcd.enable = false;
    interfaces.enp3s0.wakeOnLan = {
      enable = true;
      policy = [ "magic" ];
    };
  };
  facter.reportPath = ./facter.json;
  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config.nvidia.acceptLicense = true;

  boot.loader = {
    efi.efiSysMountPoint = lib.mkForce "/efi";
    systemd-boot.xbootldrMountPoint = "/boot";
  };
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  fileSystems."/mnt/data" = {
    device = "10.0.0.2:/volume1/linux_data";
    fsType = "nfs4";
  };

  virtualisation.libvirtd = {
    enable = true;
    dbus.enable = true;
  };

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        action.id == "org.libvirt.unix.manage" &&
        subject.user == "libvirtdbus"
      ) {
        return polkit.Result.YES;
      }
    });
  '';

  services = {

    xserver.videoDrivers = [ "nvidia" ];
    cockpit = {
      enable = true;
      allowed-origins = [ "https://10.0.0.3:9090" ];
      plugins = [ pkgs.cockpit-machines ];
    };

    sunshine = {
      enable = false;
      capSysAdmin = true;
      openFirewall = true;
      package = pkgs.unstable.sunshine;
    };
  };
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    qemu-utils
    efibootmgr
  ];

  power.ups = {
    enable = true;
    mode = "netclient";
    upsmon = {
      enable = true;
      monitor.synology = {
        system = "ups@10.0.0.2";
        powerValue = 1;
        user = "monuser";
        passwordFile = "/persist/secrets/nut-password";
        type = "slave";
      };
    };
  };

  systemd.tmpfiles.rules = [
    "d /persist/secrets 0700 root root -"
  ];

  users.users.liqihao.extraGroups = [
    "docker"
    "libvirtd"
  ];
}
