# k6
# =============
# k6 - Modern load testing tool
# https://k6.io/
#
# k6 is a developer-centric, free and open-source load testing tool
# built for making performance testing a productive experience.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.k6;
  name = "k6";
  tag = "v${pkgs.k6.version}";
  entrypoint = [ "${pkgs.k6}/bin/k6" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    bash
    curl
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "k6";
    "org.opencontainers.image.description" = "Modern load testing tool for developers";
    "org.opencontainers.image.version" = pkgs.k6.version;
  };
}
