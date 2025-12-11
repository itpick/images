{ mkImage, pkgs, lib, ... }:

# SPIFFE Helper - Sidecar for SPIFFE workload API
# https://github.com/spiffe/spiffe-helper

mkImage {
  drv = pkgs.spiffe-helper;
  name = "spiffe-helper";
  tag = "v${pkgs.spiffe-helper.version}";
  entrypoint = [ "${pkgs.spiffe-helper}/bin/spiffe-helper" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "SPIFFE Helper";
    "org.opencontainers.image.description" = "Sidecar for fetching X.509 certificates from SPIFFE workload API";
    "org.opencontainers.image.version" = pkgs.spiffe-helper.version;
  };
}
