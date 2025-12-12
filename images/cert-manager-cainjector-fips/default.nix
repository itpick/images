{ mkImage, pkgs, lib, ... }:

# cert-manager CA Injector FIPS - CA bundle injector for cert-manager (FIPS 140-3 compliant)
# https://github.com/cert-manager/cert-manager
# Built with GOEXPERIMENT=boringcrypto for FIPS compliance
# Uses custom package from pkgs/cert-manager-fips

let
  cert-manager-fips = pkgs.cert-manager-fips;
  version = cert-manager-fips.version;
in
mkImage {
  drv = cert-manager-fips.cainjector;
  name = "cert-manager-cainjector-fips";
  tag = "v${version}";
  entrypoint = [ "${cert-manager-fips.cainjector}/bin/cert-manager-cainjector" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata cacert ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager CA Injector (FIPS)";
    "org.opencontainers.image.description" = "CA bundle injector for cert-manager (FIPS 140-3 compliant)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
    "io.nix-containers.fips" = "true";
  };
}
