{ mkImage, localPkgs, lib, ... }:

# Argo Workflow Executor FIPS (argoexec) - runs in workflow pods (FIPS 140-3 compliant)
# https://github.com/argoproj/argo-workflows
# Built with GOEXPERIMENT=boringcrypto for FIPS compliance

let
  argo-workflows-fips = localPkgs.argo-workflows-fips;
  argoexec-fips = argo-workflows-fips.argoexec;

in mkImage {
  drv = argoexec-fips;
  name = "argo-workflow-executor-fips";
  tag = "v${argo-workflows-fips.version}";
  entrypoint = [ "${argoexec-fips}/bin/argoexec" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflow Executor (FIPS)";
    "org.opencontainers.image.description" = "Executor that runs in Argo Workflow pods (FIPS 140-3 compliant)";
    "org.opencontainers.image.version" = argo-workflows-fips.version;
    "io.nix-containers.chart" = "argo-workflows";
    "io.nix-containers.fips" = "true";
  };
}
