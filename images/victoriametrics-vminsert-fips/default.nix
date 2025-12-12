{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vminsert FIPS - FIPS 140-3 compliant cluster insert component
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/

let
  vm-cluster-fips = pkgs.victoriametrics-cluster-fips;
  version = vm-cluster-fips.version;
in
mkImage {
  drv = vm-cluster-fips.vminsert;
  name = "victoriametrics-vminsert-fips";
  tag = "v${version}";
  entrypoint = [ "${vm-cluster-fips.vminsert}/bin/vminsert" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vminsert FIPS";
    "org.opencontainers.image.description" = "FIPS 140-3 compliant cluster insert component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-cluster";
    "io.nix-containers.fips" = "true";
  };
}
