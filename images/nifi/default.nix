# nifi
# =============
# Apache NiFi - Data flow automation and management
# https://nifi.apache.org/
#
# Apache NiFi is a Java application for data flow automation.

{ nix2container, pkgs, lib, ... }:

# NiFi is available in nixpkgs

let
  nifi = pkgs.nifi;
  version = nifi.version;

in
nix2container.buildImage {
  name = "nifi";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "nifi-root";
    paths = [
      # NiFi application
      nifi

      # Java runtime
      pkgs.openjdk21_headless

      # Shell and utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils
      pkgs.gnugrep
      pkgs.procps

      # XML tools
      pkgs.xmlstarlet

      # Python for some NiFi processors
      pkgs.python3

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "nifi-dirs" {} ''
        mkdir -p $out/opt/nifi/conf
        mkdir -p $out/opt/nifi/logs
        mkdir -p $out/opt/nifi/flowfile_repository
        mkdir -p $out/opt/nifi/content_repository
        mkdir -p $out/opt/nifi/database_repository
        mkdir -p $out/opt/nifi/provenance_repository
        mkdir -p $out/opt/nifi/state
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/opt" "/tmp" ];
  };

  config = {
    entrypoint = [ "${nifi}/bin/nifi.sh" ];
    cmd = [ "run" ];
    workingDir = "/opt/nifi";
    exposedPorts = {
      "8080/tcp" = {};   # HTTP
      "8443/tcp" = {};   # HTTPS
      "10000/tcp" = {};  # Site-to-Site
    };
    env = [
      "NIFI_HOME=${nifi}"
      "NIFI_LOG_DIR=/opt/nifi/logs"
      "NIFI_PID_DIR=/opt/nifi"
      "JAVA_HOME=${pkgs.openjdk21_headless}"
    ];
    labels = {
      "org.opencontainers.image.title" = "Apache NiFi";
      "org.opencontainers.image.description" = "Data flow automation and management";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "nifi";
    };
  };
}
