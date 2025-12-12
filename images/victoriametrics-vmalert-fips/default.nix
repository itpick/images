{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmalert FIPS - FIPS 140-3 compliant alerting component
# https://victoriametrics.com/blog/fips-140-3-compatible-builds-for-victoriametrics-enterprise-components/

let
  vm-utils-fips = pkgs.victoriametrics-utils-fips;
  version = vm-utils-fips.version;
in
mkImage {
  drv = vm-utils-fips.vmalert;
  name = "victoriametrics-vmalert-fips";
  tag = "v${version}";
  entrypoint = [ "${vm-utils-fips.vmalert}/bin/vmalert" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmalert FIPS";
    "org.opencontainers.image.description" = "FIPS 140-3 compliant alerting and recording rules executor";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "victoria-metrics-alert";
    "io.nix-containers.fips" = "true";
  };
}
