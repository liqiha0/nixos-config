{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager ];
}

