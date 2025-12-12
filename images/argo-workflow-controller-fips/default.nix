{ mkImage, localPkgs, lib, ... }:

# Argo Workflow Controller FIPS - orchestrates workflows in Kubernetes (FIPS 140-3 compliant)
# https://github.com/argoproj/argo-workflows
# Built with GOEXPERIMENT=boringcrypto for FIPS compliance

let
  argo-workflows-fips = localPkgs.argo-workflows-fips;
  workflow-controller-fips = argo-workflows-fips.workflow-controller;

in mkImage {
  drv = workflow-controller-fips;
  name = "argo-workflow-controller-fips";
  tag = "v${argo-workflows-fips.version}";
  entrypoint = [ "${workflow-controller-fips}/bin/workflow-controller" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflow Controller (FIPS)";
    "org.opencontainers.image.description" = "Controller that orchestrates Argo Workflows (FIPS 140-3 compliant)";
    "org.opencontainers.image.version" = argo-workflows-fips.version;
    "io.nix-containers.chart" = "argo-workflows";
    "io.nix-containers.fips" = "true";
  };
}
