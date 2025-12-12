{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics FIPS - FIPS 140-3 compliant time series database
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/

let
  vm-fips = pkgs.victoriametrics-fips;
  version = vm-fips.version;
in
mkImage {
  drv = vm-fips;
  name = "victoria-metrics-fips";
  tag = "v${version}";
  entrypoint = [ "${vm-fips}/bin/victoria-metrics" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics FIPS";
    "org.opencontainers.image.description" = "FIPS 140-3 compliant time series database";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.fips" = "true";
  };
}
