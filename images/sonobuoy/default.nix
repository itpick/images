{ mkImage, pkgs, lib, ... }:

# Sonobuoy - Diagnostic tool for Kubernetes clusters
# https://sonobuoy.io/

mkImage {
  drv = pkgs.sonobuoy;
  name = "sonobuoy";
  tag = "v${pkgs.sonobuoy.version}";
  entrypoint = [ "${pkgs.sonobuoy}/bin/sonobuoy" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Sonobuoy";
    "org.opencontainers.image.description" = "Diagnostic tool that makes it easier to understand the state of a Kubernetes cluster";
    "org.opencontainers.image.version" = pkgs.sonobuoy.version;
  };
}
