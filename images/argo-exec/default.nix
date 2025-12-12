{ mkImage, pkgs, lib, ... }:

# Argo Executor (argoexec) - runs within workflow pods to execute steps
# Uses custom package from pkgs/argo-workflows

let
  argo-workflows = pkgs.argo-workflows;
  version = argo-workflows.version;
in
mkImage {
  drv = argo-workflows.argoexec;
  name = "argo-exec";
  tag = "v${version}";
  entrypoint = [ "${argo-workflows.argoexec}/bin/argoexec" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata git ];

  labels = {
    "org.opencontainers.image.title" = "Argo Executor";
    "org.opencontainers.image.description" = "Executor for Argo Workflows - runs workflow steps";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "argo-workflows";
  };
}
