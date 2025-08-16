{ lib, ... }:

{
  disko.devices.disk.main = {
    type = "disk";
    device = lib.mkDefault "/dev/disk/by-id/ata-KINGSTON_SA400S37480G_50026B7383210474";
    content = {
      type = "gpt";
      partitions = {
        bios = {
          priority = 1;
          label = "bios";
          start = "1M";
          end = "2M";
          type = "EF02";
        };
        swap = {
          label = "swap";
          size = "16G";
          content = {
            type = "swap";
            extraArgs = [
              "-L"
              "nixos-swap"
            ];
          };
        };
        btrfs = {
          label = "btrfs";
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [
              "-f"
              "-L"
              "nixos-btrfs"
            ];
            subvolumes = {
              "@boot" = {
                mountpoint = "/boot";
                mountOptions = [ "noatime" ];
              };
              "@nix" = {
                mountpoint = "/nix";
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                ];
              };
              "@persist" = {
                mountpoint = "/persist";
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                ];
              };
              "@root" = { };
            };
          };
        };
      };
    };
  };
}
