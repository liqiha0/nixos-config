{
  fileSystems."/efi" = {
    device = "/dev/disk/by-id/nvme-WDC_WDS100T2B0C-00PXH0_212041474914-part1";
    fsType = "vfat";
    options = [ "umask=0077" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-partlabel/NIXBOOT";
    fsType = "vfat";
    options = [ "umask=0077" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-partlabel/NIXROOT";
    fsType = "btrfs";
    options = [
      "subvol=@nix"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-partlabel/NIXROOT";
    fsType = "btrfs";
    options = [
      "subvol=@persist"
      "compress=zstd"
      "noatime"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-partlabel/NIXSWAP"; }
  ];
}
