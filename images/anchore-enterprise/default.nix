# anchore-enterprise
# =============
# Anchore Enterprise - Container security and compliance platform
# https://anchore.com/
#
# Anchore Enterprise provides container image scanning, policy enforcement,
# and compliance reporting. It's a commercial product with enterprise features
# beyond the open-source Anchore Engine.
#
# NOTE: This is a commercial product. Binaries are not publicly available.
# For deployment, you need to either:
# 1. Pull from Anchore's private registry with valid license
# 2. Use Grype/Syft (open source) as scanning alternatives
#
# This implementation uses Grype (vulnerability scanner) and Syft (SBOM generator)
# as open-source alternatives for container security scanning.

{ nix2container, pkgs, lib, ... }:

let
  version = "5.11.0";

in
nix2container.buildImage {
  name = "anchore-enterprise";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "anchore-enterprise-root";
    paths = [
      # Anchore's open-source tools
      pkgs.grype   # Vulnerability scanner
      pkgs.syft    # SBOM generator

      # Runtime utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils
      pkgs.curl
      pkgs.jq

      # Container tools
      pkgs.skopeo

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "anchore-dirs" {} ''
        mkdir -p $out/etc/anchore
        mkdir -p $out/var/anchore
        mkdir -p $out/var/log/anchore
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.grype}/bin/grype" ];
    cmd = [ "--help" ];
    workingDir = "/var/anchore";
    exposedPorts = {
      "8228/tcp" = {};
      "8338/tcp" = {};
    };
    env = [
      "ANCHORE_DATA_DIR=/var/anchore"
      "GRYPE_DB_CACHE_DIR=/var/anchore/db"
    ];
    labels = {
      "org.opencontainers.image.title" = "Anchore Enterprise";
      "org.opencontainers.image.description" = "Container security platform (Grype/Syft-based implementation)";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.note" = "Using Grype/Syft as open-source alternatives";
    };
  };
}
