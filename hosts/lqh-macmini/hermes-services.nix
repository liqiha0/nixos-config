{ inputs, pkgs, ... }:

let
  userHome = "/Users/liqihao";
  fish = "${pkgs.fish}/bin/fish";
  system = pkgs.stdenv.hostPlatform.system;
  hermesAgentPackage = inputs.hermes-agent.packages.${system}.default;
  hermesWebuiPackage = inputs.hermes-webui.packages.${system}.default;
  hermesAgentPython = "${hermesAgentPackage.passthru.hermesVenv}/bin/python3";
in
{
  environment.systemPackages = [
    hermesAgentPackage
    hermesWebuiPackage
  ];

  launchd.user.agents = {
    hermes = {
      command = "${fish} -lc 'exec ${hermesAgentPackage}/bin/hermes gateway run --replace'";
      environment = {
        HOME = userHome;
        USER = "liqihao";
      };
      serviceConfig = {
        RunAtLoad = true;
        KeepAlive = true;
        WorkingDirectory = userHome;
        ProcessType = "Background";
      };
    };

    hermes-zsj = {
      command = "${fish} -lc 'exec ${hermesAgentPackage}/bin/hermes -p hermes-zsj gateway run --replace'";
      environment = {
        HOME = userHome;
        USER = "liqihao";
      };
      serviceConfig = {
        RunAtLoad = true;
        KeepAlive = true;
        WorkingDirectory = userHome;
        ProcessType = "Background";
      };
    };

    hermes-webui = {
      command = "${fish} -lc 'exec ${hermesWebuiPackage}/bin/hermes-webui'";
      environment = {
        HOME = userHome;
        USER = "liqihao";
        HERMES_HOME = "${userHome}/.hermes";
        HERMES_WEBUI_DEFAULT_WORKSPACE = "${userHome}/workspace";
        HERMES_WEBUI_HOST = "0.0.0.0";
        HERMES_WEBUI_PORT = "8787";
        HERMES_WEBUI_PYTHON = hermesAgentPython;
        HERMES_WEBUI_STATE_DIR = "${userHome}/.hermes/webui";
      };
      serviceConfig = {
        RunAtLoad = true;
        KeepAlive = true;
        WorkingDirectory = userHome;
        ProcessType = "Background";
        StandardOutPath = "${userHome}/Library/Logs/hermes-webui.log";
        StandardErrorPath = "${userHome}/Library/Logs/hermes-webui.error.log";
      };
    };
  };
}
