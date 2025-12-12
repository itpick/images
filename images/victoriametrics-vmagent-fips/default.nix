{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmagent FIPS - FIPS 140-3 compliant metrics collector
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/

let
  vm-utils-fips = pkgs.victoriametrics-utils-fips;
  version = vm-utils-fips.version;
in
mkImage {
  drv = vm-utils-fips.vmagent;
  name = "victoriametrics-vmagent-fips";
  tag = "v${version}";
  entrypoint = [ "${vm-utils-fips.vmagent}/bin/vmagent" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmagent FIPS";
    "org.opencontainers.image.description" = "FIPS 140-3 compliant metrics collector";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-agent";
    "io.nix-containers.fips" = "true";
  };
}
