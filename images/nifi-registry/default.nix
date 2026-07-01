# nifi-registry
# =============
# Apache NiFi Registry - Flow registry for NiFi
# https://nifi.apache.org/registry.html
#
# NiFi Registry is a complementary application that provides a central location
# for storage and management of shared resources across one or more instances of NiFi.

{ nix2container, pkgs, lib, ... }:

let
  version = "2.6.0";

  # Download NiFi Registry distribution
  nifiRegistry = pkgs.fetchzip {
    url = "https://archive.apache.org/dist/nifi/${version}/nifi-registry-${version}-bin.zip";
    hash = "sha256-IPCZ2E7hcuMoXCVNtsqzxeuAkLmQ9cAUozjUz+vSyYA=";  # TODO: Fix hash after first build
  };

in
nix2container.buildImage {
  name = "nifi-registry";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "nifi-registry-root";
    paths = [
      # Java runtime
      pkgs.openjdk21_headless

      # Shell and utilities
      pkgs.bash
      pkgs.dash
      pkgs.coreutils
      pkgs.gnugrep
      pkgs.procps
      pkgs.nettools

      # XML tools
      pkgs.xmlstarlet

      # SSL/TLS
      pkgs.cacert

      # Create directories and install NiFi Registry
      (pkgs.runCommand "nifi-registry-install" {} ''
        mkdir -p $out/opt/nifi-registry
        cp -r ${nifiRegistry}/* $out/opt/nifi-registry/
        chmod -R u+w $out/opt/nifi-registry

        mkdir -p $out/opt/nifi-registry/logs
        mkdir -p $out/opt/nifi-registry/database
        mkdir -p $out/opt/nifi-registry/flow_storage
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/opt" "/tmp" ];
  };

  config = {
    entrypoint = [ "/opt/nifi-registry/bin/nifi-registry.sh" ];
    cmd = [ "run" ];
    workingDir = "/opt/nifi-registry";
    exposedPorts = {
      "18080/tcp" = {};  # HTTP
      "18443/tcp" = {};  # HTTPS
    };
    env = [
      "NIFI_REGISTRY_HOME=/opt/nifi-registry"
      "NIFI_REGISTRY_LOG_DIR=/opt/nifi-registry/logs"
      "JAVA_HOME=${pkgs.openjdk21_headless}"
    ];
    labels = {
      "org.opencontainers.image.title" = "Apache NiFi Registry";
      "org.opencontainers.image.description" = "Flow registry for Apache NiFi";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "nifi";
    };
  };
}
