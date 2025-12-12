{ mkImage, pkgs, lib, ... }:

# cert-manager Webhook FIPS - Validating and mutating webhook for cert-manager (FIPS 140-3 compliant)
# https://github.com/cert-manager/cert-manager
# Built with GOEXPERIMENT=boringcrypto for FIPS compliance
# Uses custom package from pkgs/cert-manager-fips

let
  cert-manager-fips = pkgs.cert-manager-fips;
  version = cert-manager-fips.version;
in
mkImage {
  drv = cert-manager-fips.webhook;
  name = "cert-manager-webhook-fips";
  tag = "v${version}";
  entrypoint = [ "${cert-manager-fips.webhook}/bin/cert-manager-webhook" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata cacert ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager Webhook (FIPS)";
    "org.opencontainers.image.description" = "Validating and mutating webhook for cert-manager (FIPS 140-3 compliant)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
    "io.nix-containers.fips" = "true";
  };
}
