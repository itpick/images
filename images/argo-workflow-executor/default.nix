{ mkImage, localPkgs, lib, ... }:

# Argo Workflow Executor (argoexec) - runs in workflow pods
# https://github.com/argoproj/argo-workflows

let
  argo-workflows = localPkgs.argo-workflows;
  argoexec = argo-workflows.argoexec;

in mkImage {
  drv = argoexec;
  name = "argo-workflow-executor";
  tag = "v${argo-workflows.version}";
  entrypoint = [ "${argoexec}/bin/argoexec" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflow Executor";
    "org.opencontainers.image.description" = "Executor that runs in Argo Workflow pods";
    "org.opencontainers.image.version" = argo-workflows.version;
    "io.nix-containers.chart" = "argo-workflows";
  };
}
