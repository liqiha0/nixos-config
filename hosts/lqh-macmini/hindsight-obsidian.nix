{ pkgs, ... }:

let
  user = "liqihao";
  userHome = "/Users/${user}";
  vaultPath = "${userHome}/Documents/Obsidian Vault/Second Brain";
in
{
  launchd.user.agents.hindsight-obsidian = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.bun}/bin/bunx"
        "@vectorize-io/hindsight-obsidian@0.2.1"
        "reconcile"
        "--vault"
        vaultPath
        "--bank"
        "obsidian"
        "--api-url"
        "http://localhost:8888"
        "--vault-name"
        "Second Brain"
        "--prefix-doc-id"
        "--watch"
      ];
      EnvironmentVariables = {
        HOME = userHome;
        USER = user;
      };
      RunAtLoad = true;
      KeepAlive = true;
      ThrottleInterval = 10;
      WorkingDirectory = userHome;
      ProcessType = "Background";
      StandardOutPath = "${userHome}/Library/Logs/hindsight-obsidian.log";
      StandardErrorPath = "${userHome}/Library/Logs/hindsight-obsidian.error.log";
    };
  };
}
