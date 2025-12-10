{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for fluentd:
# Packages available in nixpkgs:
#   pkgs.fluentd  # Data collector
# Note: Many Ruby-based fluentd plugins are not packaged in nixpkgs

let
  # Extract version from package name (fluentd-1.18.0 -> 1.18.0)
  version = builtins.elemAt (lib.splitString "-" pkgs.fluentd.name) 1;
in
mkImage {
  drv = pkgs.fluentd;
  name = "fluentd";
  tag = "v${version}";
  entrypoint = [ "${pkgs.fluentd}/bin/fluentd" ];
  cmd = [ "-c" "/fluentd/etc/fluent.conf" ];

  env = {
    FLUENTD_CONF = "fluent.conf";
    FLUENTD_OPT = "";
  };

  labels = {
    "org.opencontainers.image.title" = "Fluentd";
    "org.opencontainers.image.description" = "Unified logging layer data collector";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "fluentd";
  };
}
