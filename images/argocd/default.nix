{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.argocd;
  name = "argocd";
  tag = "v${pkgs.argocd.version}";
  entrypoint = [ "${pkgs.argocd}/bin/argocd" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Argo CD";
    "org.opencontainers.image.description" = "Declarative GitOps CD for Kubernetes";
    "org.opencontainers.image.version" = pkgs.argocd.version;
    "io.nix-containers.chart" = "argocd";
  };
}
