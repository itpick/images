{ mkImage, pkgs, lib, ... }:

# Kuma Control Plane - Service mesh controller
# https://kuma.io/

mkImage {
  drv = pkgs.kuma-cp;
  name = "kuma-cp";
  tag = "v${pkgs.kuma-cp.version}";
  entrypoint = [ "${pkgs.kuma-cp}/bin/kuma-cp" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kuma Control Plane";
    "org.opencontainers.image.description" = "Universal service mesh control plane";
    "org.opencontainers.image.version" = pkgs.kuma-cp.version;
  };
}
