{ mkImage, pkgs, lib, ... }:

# Uses keda package from pkgs/keda
# Built from wolfi-dev/os keda-2.18.yaml
# https://github.com/kedacore/keda

let
  keda = pkgs.keda;
  version = keda.version;
in
mkImage {
  drv = keda;
  name = "keda-metrics-apiserver";
  tag = "v${version}";
  entrypoint = [ "${keda}/bin/keda-adapter" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];

  labels = {
    "org.opencontainers.image.title" = "KEDA Metrics API Server";
    "org.opencontainers.image.description" = "Kubernetes custom metrics server for KEDA";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "keda";
  };
}
