# windows-exporter
# =============
# Windows Exporter - Prometheus exporter for Windows machines
# https://github.com/prometheus-community/windows_exporter
#
# The Windows Exporter collects metrics from Windows systems
# and exposes them in Prometheus format.
#
# NOTE: This exporter is Windows-only and cannot run in a Linux container.
# It must be deployed as a native Windows service or Windows container.
#
# For Linux/Unix systems, use node_exporter instead:
# - images/node-exporter/default.nix
#
# This file exists as a placeholder to document that Windows Exporter
# is not applicable for Nix-based Linux containers.

{ nix2container, pkgs, lib, ... }:

let
  version = "0.29.2";

  # Create a script that explains the situation
  windowsExporterScript = pkgs.writeShellScriptBin "windows-exporter" ''
    #!/usr/bin/env bash
    echo "============================================"
    echo "Windows Exporter - Not Applicable"
    echo "============================================"
    echo ""
    echo "Windows Exporter is a Windows-only application."
    echo "It cannot run in Linux containers."
    echo ""
    echo "For Linux/Unix metrics collection, use:"
    echo "  - node_exporter (Prometheus Node Exporter)"
    echo ""
    echo "For Windows hosts, deploy Windows Exporter as:"
    echo "  - A native Windows service"
    echo "  - A Windows container"
    echo ""
    echo "Download: https://github.com/prometheus-community/windows_exporter/releases"
    echo ""
    exit 1
  '';

in
nix2container.buildImage {
  name = "windows-exporter";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "windows-exporter-root";
    paths = [
      windowsExporterScript
      pkgs.bash
      pkgs.busybox
    ];
    pathsToLink = [ "/bin" ];
  };

  config = {
    entrypoint = [ "${windowsExporterScript}/bin/windows-exporter" ];
    cmd = [];
    labels = {
      "org.opencontainers.image.title" = "Windows Exporter";
      "org.opencontainers.image.description" = "Windows Exporter placeholder (Windows-only application)";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.note" = "Windows-only - use node_exporter for Linux";
    };
  };
}
