# contour
# =============
# Contour - Kubernetes ingress controller using Envoy proxy
# https://projectcontour.io/
#
# Contour is an open source Kubernetes ingress controller providing
# the control plane for the Envoy edge and service proxy.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.contour;
  name = "contour";
  tag = "v${pkgs.contour.version}";
  entrypoint = [ "${pkgs.contour}/bin/contour" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Contour";
    "org.opencontainers.image.description" = "Kubernetes ingress controller using Envoy proxy";
    "org.opencontainers.image.version" = pkgs.contour.version;
  };
}
