# gitlab-certificates
# =============
# GitLab Certificates - Init container for certificate management
# https://gitlab.com/gitlab-org/gitlab

{ nix2container, pkgs, lib, ... }:

# GitLab Certificates handles certificate configuration and updates

let
  version = "18.6.1";

  # Script to update certificates
  updateCertsScript = pkgs.writeShellScript "update-certificates" ''
    #!/bin/bash
    set -e

    # Copy custom certificates if present
    if [ -d /custom-certs ]; then
      cp -r /custom-certs/* /etc/ssl/certs/ 2>/dev/null || true
    fi

    # Update CA certificates
    if command -v update-ca-certificates &> /dev/null; then
      update-ca-certificates
    fi

    echo "Certificate update completed"
  '';

in
nix2container.buildImage {
  name = "gitlab-certificates";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "gitlab-certificates-root";
    paths = with pkgs; [
      # Shell and utilities
      bash
      busybox
      coreutils
      findutils
      gawk
      gnugrep

      # SSL/TLS
      cacert
      openssl

      # Process management
      tini

      # Templating
      gomplate

      # Create required directories and scripts
      (pkgs.runCommand "gitlab-certs-dirs" {} ''
        mkdir -p $out/scripts
        mkdir -p $out/etc/ssl/certs
        mkdir -p $out/custom-certs
        cp ${updateCertsScript} $out/scripts/update-certificates
        chmod +x $out/scripts/update-certificates
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/scripts" "/custom-certs" ];
  };

  config = {
    entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
    cmd = [ "/scripts/update-certificates" ];
    labels = {
      "org.opencontainers.image.title" = "GitLab Certificates";
      "org.opencontainers.image.description" = "Certificate management for GitLab";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
