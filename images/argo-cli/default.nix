{ mkImage, pkgs, lib, ... }:

# Argo CLI - Command line interface for Argo Workflows
# Uses custom package from pkgs/argo-workflows

let
  argo-workflows = pkgs.argo-workflows;
  version = argo-workflows.version;
in
mkImage {
  drv = argo-workflows.argo-cli;
  name = "argo-cli";
  tag = "v${version}";
  entrypoint = [ "${argo-workflows.argo-cli}/bin/argo" ];
  cmd = [ "help" ];

  extraPkgs = with pkgs; [ cacert tzdata git ];

  labels = {
    "org.opencontainers.image.title" = "Argo CLI";
    "org.opencontainers.image.description" = "Command line interface for Argo Workflows";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "argo-workflows";
  };
}
