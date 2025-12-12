{ mkImage, pkgs, lib, ... }:

# cert-manager Controller FIPS - Automatic TLS certificate management controller (FIPS 140-3 compliant)
# https://github.com/cert-manager/cert-manager
# Built with GOEXPERIMENT=boringcrypto for FIPS compliance
# Uses custom package from pkgs/cert-manager-fips

let
  cert-manager-fips = pkgs.cert-manager-fips;
  version = cert-manager-fips.version;
in
mkImage {
  drv = cert-manager-fips.controller;
  name = "cert-manager-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${cert-manager-fips.controller}/bin/cert-manager-controller" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata cacert ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager Controller (FIPS)";
    "org.opencontainers.image.description" = "Automatic TLS certificate management controller (FIPS 140-3 compliant)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
    "io.nix-containers.fips" = "true";
  };
}
