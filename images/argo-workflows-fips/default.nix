{ mkImage, pkgs, lib, ... }:

# Argo Workflows FIPS - Container native workflow engine for Kubernetes (FIPS 140-3 compliant)
# This image provides the Argo CLI for interacting with Argo Workflows
# Built with GOEXPERIMENT=boringcrypto for FIPS compliance
# Uses custom package from pkgs/argo-workflows-fips

let
  argo-workflows-fips = pkgs.argo-workflows-fips;
  version = argo-workflows-fips.version;
in
mkImage {
  drv = argo-workflows-fips.argo-cli;
  name = "argo-workflows-fips";
  tag = "v${version}";
  entrypoint = [ "${argo-workflows-fips.argo-cli}/bin/argo" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [ cacert tzdata git ];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflows CLI (FIPS)";
    "org.opencontainers.image.description" = "Container native workflow engine for Kubernetes - CLI (FIPS 140-3 compliant)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "argo-workflows";
    "io.nix-containers.fips" = "true";
  };
}
