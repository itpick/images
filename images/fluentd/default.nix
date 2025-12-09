{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for fluentd:
# Packages available in nixpkgs:
#   pkgs.fluentd  # Data collector
# Note: Many Ruby-based fluentd plugins are not packaged in nixpkgs

mkImage {
  drv = pkgs.fluentd;
  name = "fluentd";
  tag = "v${pkgs.fluentd.version}";
  entrypoint = [ "${pkgs.fluentd}/bin/fluentd" ];
  cmd = [ "-c" "/fluentd/etc/fluent.conf" ];

  env = {
    FLUENTD_CONF = "fluent.conf";
    FLUENTD_OPT = "";
  };

  labels = {
    "org.opencontainers.image.title" = "Fluentd";
    "org.opencontainers.image.description" = "Unified logging layer data collector";
    "org.opencontainers.image.version" = pkgs.fluentd.version;
    "io.nix-containers.chart" = "fluentd";
  };
}
