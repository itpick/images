{ buildCLIImage, pkgs, lib, ... }:

# Flux Operator - Kubernetes controller for managing Flux CD lifecycle
buildCLIImage {
  drv = pkgs.fluxcd-operator;
  name = "flux-operator";
  tag = "v${pkgs.fluxcd-operator.version}";
  entrypoint = [ "${pkgs.fluxcd-operator}/bin/flux-operator" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Operator";
    "org.opencontainers.image.description" = "Kubernetes controller for managing Flux CD lifecycle";
    "org.opencontainers.image.version" = pkgs.fluxcd-operator.version;
    "io.nix-containers.chart" = "flux-operator";
  };
}
