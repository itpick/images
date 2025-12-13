{ mkImage, pkgs, lib, ... }:

# Argo Workflow Controller - orchestrates workflows in Kubernetes
# https://github.com/argoproj/argo-workflows

let
  argo-workflows = pkgs.argo-workflows;
  workflow-controller = argo-workflows.workflow-controller;

in mkImage {
  drv = workflow-controller;
  name = "argo-workflow-controller";
  tag = "v${argo-workflows.version}";
  entrypoint = [ "${workflow-controller}/bin/workflow-controller" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflow Controller";
    "org.opencontainers.image.description" = "Controller that orchestrates Argo Workflows";
    "org.opencontainers.image.version" = argo-workflows.version;
    "io.nix-containers.chart" = "argo-workflows";
  };
}
