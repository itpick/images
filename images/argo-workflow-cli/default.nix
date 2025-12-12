{ mkImage, localPkgs, lib, ... }:

# Argo CLI - command line interface for Argo Workflows
# https://github.com/argoproj/argo-workflows

let
  argo-workflows = localPkgs.argo-workflows;
  argo-cli = argo-workflows.argo-cli;

in mkImage {
  drv = argo-cli;
  name = "argo-workflow-cli";
  tag = "v${argo-workflows.version}";
  entrypoint = [ "${argo-cli}/bin/argo" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Argo Workflow CLI";
    "org.opencontainers.image.description" = "Command line interface for Argo Workflows";
    "org.opencontainers.image.version" = argo-workflows.version;
    "io.nix-containers.chart" = "argo-workflows";
  };
}
