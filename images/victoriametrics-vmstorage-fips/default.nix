{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmstorage FIPS - FIPS 140-3 compliant cluster storage component
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/

let
  vm-cluster-fips = pkgs.victoriametrics-cluster-fips;
  version = vm-cluster-fips.version;
in
mkImage {
  drv = vm-cluster-fips.vmstorage;
  name = "victoriametrics-vmstorage-fips";
  tag = "v${version}";
  entrypoint = [ "${vm-cluster-fips.vmstorage}/bin/vmstorage" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmstorage FIPS";
    "org.opencontainers.image.description" = "FIPS 140-3 compliant cluster storage component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-cluster";
    "io.nix-containers.fips" = "true";
  };
}
