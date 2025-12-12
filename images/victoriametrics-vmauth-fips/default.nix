{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmauth FIPS - FIPS 140-3 compliant auth proxy
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/

let
  vm-utils-fips = pkgs.victoriametrics-utils-fips;
  version = vm-utils-fips.version;
in
mkImage {
  drv = vm-utils-fips.vmauth;
  name = "victoriametrics-vmauth-fips";
  tag = "v${version}";
  entrypoint = [ "${vm-utils-fips.vmauth}/bin/vmauth" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmauth FIPS";
    "org.opencontainers.image.description" = "FIPS 140-3 compliant authentication proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-auth";
    "io.nix-containers.fips" = "true";
  };
}
