# grpc-health-probe
# =============
# gRPC Health Probe - Kubernetes health checking tool for gRPC
# https://github.com/grpc-ecosystem/grpc-health-probe
#
# A command-line tool to perform health-checks for gRPC applications
# in Kubernetes.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.grpc-health-probe;
  name = "grpc-health-probe";
  tag = "v${pkgs.grpc-health-probe.version}";
  entrypoint = [ "${pkgs.grpc-health-probe}/bin/grpc-health-probe" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "gRPC Health Probe";
    "org.opencontainers.image.description" = "Kubernetes health checking for gRPC applications";
    "org.opencontainers.image.version" = pkgs.grpc-health-probe.version;
  };
}
