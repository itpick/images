{ mkImage, pkgs, lib, ... }:

let
  # Use the server binary from custom pkgs (supports `crossplane core start`)
  # nixpkgs.crossplane-cli is the CLI tool only (doesn't have core subcommand)
  crossplane-server = pkgs.crossplane-server;

  # Create /crds and /webhookconfigurations directories at container root
  # crossplane init expects both directories at filesystem root
  clusterFiles = pkgs.runCommand "crossplane-cluster-files" {} ''
    mkdir -p $out/crds $out/webhookconfigurations
    cp -r ${crossplane-server}/crds/* $out/crds/
    cp -r ${crossplane-server}/webhookconfigurations/* $out/webhookconfigurations/
  '';
in

# Chainguard SBOM packages for crossplane:
# Packages available in nixpkgs:
#   pkgs.crossplane-cli  # CLI tool only (2.0.2) - does NOT support `core` subcommand
#
# Custom package pkgs.crossplane-server:
#   Built from github.com/crossplane/crossplane/v2 - the actual server binary
#   Supports: crossplane core start, crossplane core init
#
# The crossplane helm chart runs:
#   - Init container: crossplane core init --activation *
#   - Main container: crossplane core start

mkImage {
  drv = crossplane-server;
  name = "crossplane";
  tag = "v${crossplane-server.version}";
  entrypoint = [ "${crossplane-server}/bin/crossplane" ];
  # No default cmd - helm chart provides "core start" or "core init" as args
  cmd = [];
  # Include cluster files (/crds and /webhookconfigurations) at container root
  extraContents = [ clusterFiles ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane";
    "org.opencontainers.image.description" = "Cloud Native Control Plane";
    "org.opencontainers.image.version" = crossplane-server.version;
    "io.nix-containers.chart" = "crossplane";
  };
}
