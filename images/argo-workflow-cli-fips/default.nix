{ mkImage, localPkgs, lib, ... }:

# Argo CLI FIPS - command line interface for Argo Workflows (FIPS 140-3 compliant)
# https://github.com/argoproj/argo-workflows
# Built with GOEXPERIMENT=boringcrypto for FIPS compliance

let
  argo-workflows-fips = localPkgs.argo-workflows-fips;
  argo-cli-fips = argo-workflows-fips.argo-cli;

in mkImage {
  drv = argo-cli-fips;
  name = "argo-workflow-cli-fips";
  tag = "v${argo-workflows-fips.version}";
  entrypoint = [ "${argo-cli-fips}/bin/argo" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflow CLI (FIPS)";
    "org.opencontainers.image.description" = "Command line interface for Argo Workflows (FIPS 140-3 compliant)";
    "org.opencontainers.image.version" = argo-workflows-fips.version;
    "io.nix-containers.chart" = "argo-workflows";
    "io.nix-containers.fips" = "true";
  };
}
