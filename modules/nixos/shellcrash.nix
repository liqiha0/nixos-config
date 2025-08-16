{ lib, ... }:

{
  boot.kernelModules = [
    "tun"
    "nft_socket"
    "nft_tproxy"
  ];

  virtualisation.docker.enable = true;
  virtualisation.arion = {
    backend = "docker";

    projects.shellcrash.settings = {
      project.name = "shellcrash";
      docker-compose.volumes.shellcrash = { };

      services.shellcrash.service = {
        image = "juewuy/shellcrash:latest";
        restart = "unless-stopped";
        network_mode = "host";
        volumes = [
          "shellcrash:/etc/ShellCrash"
        ];
        devices = [
          "/dev/net/tun:/dev/net/tun"
        ];
        capabilities = {
          NET_ADMIN = true;
          NET_RAW = true;
          SYS_ADMIN = true;
        };
      };
    };
  };
}
