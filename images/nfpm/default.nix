{ mkImage, pkgs, lib, ... }:

# nFPM - Simple deb and rpm packager
# https://nfpm.goreleaser.com/

mkImage {
  drv = pkgs.nfpm;
  name = "nfpm";
  tag = "v${pkgs.nfpm.version}";
  entrypoint = [ "${pkgs.nfpm}/bin/nfpm" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nFPM";
    "org.opencontainers.image.description" = "Simple deb and rpm packager written in Go";
    "org.opencontainers.image.version" = pkgs.nfpm.version;
  };
}
