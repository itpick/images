{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics Operator - Kubernetes operator for VictoriaMetrics
# https://github.com/VictoriaMetrics/operator
# Uses custom package from pkgs/victoriametrics-operator

let
  vm-operator = pkgs.victoriametrics-operator;
  version = vm-operator.version;
in
mkImage {
  drv = vm-operator;
  name = "victoriametrics-operator";
  tag = "v${version}";
  entrypoint = [ "${vm-operator}/bin/vm-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics Operator";
    "org.opencontainers.image.description" = "Kubernetes operator for VictoriaMetrics";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-operator";
  };
}
