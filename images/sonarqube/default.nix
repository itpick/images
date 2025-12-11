# sonarqube
# =============
# SonarQube - Code quality and security analysis platform
# https://github.com/SonarSource/sonarqube
#
# SonarQube is a Java application for continuous code quality inspection.
# We download the official distribution and run it with Java from nixpkgs.

{ nix2container, pkgs, lib, fetchzip, ... }:

let
  version = "10.7.0.96327";
  majorVersion = builtins.head (lib.splitString "." version);

  # Download SonarQube distribution
  sonarqube = pkgs.fetchzip {
    url = "https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${version}.zip";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
  };

  # Wrapper script for SonarQube
  sonarqubeWrapper = pkgs.writeShellScript "sonarqube-wrapper" ''
    #!/bin/bash
    set -e

    export SONAR_HOME=/opt/sonarqube
    export SONAR_JAVA_PATH=${pkgs.openjdk17}/bin/java

    # Ensure data directories exist
    mkdir -p /opt/sonarqube/data
    mkdir -p /opt/sonarqube/logs
    mkdir -p /opt/sonarqube/temp
    mkdir -p /opt/sonarqube/extensions

    # Start SonarQube
    exec ${pkgs.openjdk17}/bin/java \
      -server \
      -Xms512m -Xmx512m \
      -XX:+HeapDumpOnOutOfMemoryError \
      -Djava.net.preferIPv4Stack=true \
      -Dsonar.path.home=/opt/sonarqube \
      -Dsonar.path.data=/opt/sonarqube/data \
      -Dsonar.path.logs=/opt/sonarqube/logs \
      -Dsonar.path.temp=/opt/sonarqube/temp \
      -jar /opt/sonarqube/lib/sonarqube.jar \
      "$@"
  '';

in
nix2container.buildImage {
  name = "sonarqube";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "sonarqube-root";
    paths = [
      # Java runtime
      pkgs.openjdk17

      # Shell and utilities
      pkgs.bash
      pkgs.coreutils
      pkgs.gnugrep
      pkgs.procps
      pkgs.curl
      pkgs.wget

      # SSL/TLS
      pkgs.cacert

      # Create directories and copy SonarQube
      (pkgs.runCommand "sonarqube-install" {} ''
        mkdir -p $out/opt/sonarqube
        cp -r ${sonarqube}/* $out/opt/sonarqube/
        chmod -R u+w $out/opt/sonarqube

        mkdir -p $out/opt/sonarqube/data
        mkdir -p $out/opt/sonarqube/logs
        mkdir -p $out/opt/sonarqube/temp
        mkdir -p $out/opt/sonarqube/extensions/plugins

        mkdir -p $out/bin
        cp ${sonarqubeWrapper} $out/bin/sonarqube
        chmod +x $out/bin/sonarqube

        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/opt" "/tmp" ];
  };

  config = {
    entrypoint = [ "/opt/sonarqube/bin/linux-x86-64/sonar.sh" ];
    cmd = [ "console" ];
    workingDir = "/opt/sonarqube";
    exposedPorts = {
      "9000/tcp" = {};
    };
    env = [
      "JAVA_HOME=${pkgs.openjdk17}"
      "SONAR_HOME=/opt/sonarqube"
      "SONARQUBE_HOME=/opt/sonarqube"
    ];
    labels = {
      "org.opencontainers.image.title" = "SonarQube";
      "org.opencontainers.image.description" = "Code quality and security analysis platform";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "sonarqube";
    };
  };
}
