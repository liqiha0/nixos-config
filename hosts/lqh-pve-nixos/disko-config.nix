{ pkgs, config, lib, ... }:

{
  disko.devices = {
    disk = {
      sda = {
        type = "disk";
        device = "/dev/sda"; 

        content = {
          type = "gpt";
          partitions = {
            # EFI System Partition
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "defaults" ];
              };
            };

            # Swap Partition (8GB)
            swap = {
              size = "8G";
              content = {
                type = "swap";
              };
            };

            # Root Btrfs Partition
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Force overwrite
                
                # Subvolumes
                subvolumes = {
                  # Mount Nix Store
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };

                  # Mount Persistence Data
                  "@persist" = {
                    mountpoint = "/persist";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  
                  # Optional: A proactive snapshot/root subvol if you ever decide to stop using tmpfs
                  # But for now, we don't mount this to /, because / is tmpfs in default.nix
                  "@root" = {
                    # No mountpoint, just a placeholder/backup
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
