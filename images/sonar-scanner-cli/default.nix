{ mkImage, pkgs, lib, ... }:

# SonarScanner CLI - Code quality scanner
# https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/

mkImage {
  drv = pkgs.sonar-scanner-cli;
  name = "sonar-scanner-cli";
  tag = "v${pkgs.sonar-scanner-cli.version}";
  entrypoint = [ "${pkgs.sonar-scanner-cli}/bin/sonar-scanner" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert jdk ];

  labels = {
    "org.opencontainers.image.title" = "SonarScanner CLI";
    "org.opencontainers.image.description" = "CLI for SonarQube code quality analysis";
    "org.opencontainers.image.version" = pkgs.sonar-scanner-cli.version;
  };
}
