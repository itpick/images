{ mkImage, pkgs, lib, ... }:

# Argo Workflow Controller - orchestrates workflow execution in Kubernetes
# Uses custom package from pkgs/argo-workflows

let
  argo-workflows = pkgs.argo-workflows;
  version = argo-workflows.version;
in
mkImage {
  drv = argo-workflows.workflow-controller;
  name = "argo-workflowcontroller";
  tag = "v${version}";
  entrypoint = [ "${argo-workflows.workflow-controller}/bin/workflow-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflow Controller";
    "org.opencontainers.image.description" = "Kubernetes controller for Argo Workflows";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "argo-workflows";
  };
}
