# nifi-toolkit
# =============
# Apache NiFi Toolkit - Command-line utilities for NiFi
# https://nifi.apache.org/
#
# The NiFi Toolkit contains several command-line utilities to help
# administrators manage NiFi deployments.

{ nix2container, pkgs, lib, ... }:

let
  version = "2.6.0";

  # Download NiFi Toolkit distribution
  nifiToolkit = pkgs.fetchzip {
    url = "https://archive.apache.org/dist/nifi/${version}/nifi-toolkit-${version}-bin.zip";
    hash = "sha256-+wJelu9ld4ZhQ/ew5D1fNaQ12oYoDQhPEnM68hYmnVw=";  # TODO: Fix hash after first build
  };

in
nix2container.buildImage {
  name = "nifi-toolkit";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "nifi-toolkit-root";
    paths = [
      # Java runtime
      pkgs.openjdk21_headless

      # Shell and utilities
      pkgs.bash
      pkgs.coreutils
      pkgs.gnugrep

      # SSL/TLS
      pkgs.cacert

      # Create directories and install NiFi Toolkit
      (pkgs.runCommand "nifi-toolkit-install" {} ''
        mkdir -p $out/opt/nifi-toolkit
        cp -r ${nifiToolkit}/* $out/opt/nifi-toolkit/
        chmod -R u+w $out/opt/nifi-toolkit

        # Create symlinks to common tools
        mkdir -p $out/bin
        for script in $out/opt/nifi-toolkit/bin/*.sh; do
          name=$(basename "$script" .sh)
          ln -sf "$script" "$out/bin/$name"
        done

        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/opt" "/tmp" ];
  };

  config = {
    entrypoint = [ "/bin/bash" ];
    cmd = [];
    workingDir = "/opt/nifi-toolkit";
    env = [
      "NIFI_TOOLKIT_HOME=/opt/nifi-toolkit"
      "JAVA_HOME=${pkgs.openjdk21_headless}"
      "PATH=/opt/nifi-toolkit/bin:/bin"
    ];
    labels = {
      "org.opencontainers.image.title" = "Apache NiFi Toolkit";
      "org.opencontainers.image.description" = "Command-line utilities for Apache NiFi";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "nifi";
    };
  };
}
