{ mkImage, pkgs, lib, ... }:

# cert-manager ACME Solver FIPS - HTTP-01 challenge solver for cert-manager (FIPS 140-3 compliant)
# https://github.com/cert-manager/cert-manager
# Built with GOEXPERIMENT=boringcrypto for FIPS compliance
# Uses custom package from pkgs/cert-manager-fips

let
  cert-manager-fips = pkgs.cert-manager-fips;
  version = cert-manager-fips.version;
in
mkImage {
  drv = cert-manager-fips.acmesolver;
  name = "cert-manager-acmesolver-fips";
  tag = "v${version}";
  entrypoint = [ "${cert-manager-fips.acmesolver}/bin/cert-manager-acmesolver" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata cacert ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager ACME Solver (FIPS)";
    "org.opencontainers.image.description" = "HTTP-01 challenge solver for cert-manager (FIPS 140-3 compliant)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
    "io.nix-containers.fips" = "true";
  };
}
