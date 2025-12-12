{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics Operator FIPS - FIPS 140-3 compliant Kubernetes operator
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/

let
  vm-operator-fips = pkgs.victoriametrics-operator-fips;
  version = vm-operator-fips.version;
in
mkImage {
  drv = vm-operator-fips;
  name = "victoriametrics-operator-fips";
  tag = "v${version}";
  entrypoint = [ "${vm-operator-fips}/bin/vm-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics Operator FIPS";
    "org.opencontainers.image.description" = "FIPS 140-3 compliant Kubernetes operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-operator";
    "io.nix-containers.fips" = "true";
  };
}
