{ mkImage, pkgs, lib, ... }:

# contour-nixchart
# ================
# Envoy-native Kubernetes ingress controller (projectcontour/contour).
# Uses the custom pkgs.contour Go build from pkgs/contour/.
#
# Chart runs `contour serve` with args from values.contour.args.
# Chart contract: contour binary at ${bin}/contour; args are handled
# by the chart. Non-root UID 1001.

mkImage {
  drv = pkgs.contour;
  name = "contour-nixchart";
  tag = "v${pkgs.contour.version}";

  entrypoint = [ "${pkgs.contour}/bin/contour" ];
  cmd = [ "serve" ];

  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "contour-nixchart";
    "org.opencontainers.image.description" = "Contour ingress controller for the nix-containers charts/contour chart";
    "org.opencontainers.image.version" = pkgs.contour.version;
    "io.nix-containers.chart" = "contour";
  };
}
