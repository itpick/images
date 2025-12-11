{ mkImage, pkgs, lib, ... }:

# kuma-dp - Kuma data plane proxy
# https://kuma.io/

mkImage {
  drv = pkgs.kuma-dp;
  name = "kuma-dp";
  tag = "v${pkgs.kuma-dp.version}";
  entrypoint = [ "${pkgs.kuma-dp}/bin/kuma-dp" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "kuma-dp";
    "org.opencontainers.image.description" = "Kuma data plane proxy for service mesh";
    "org.opencontainers.image.version" = pkgs.kuma-dp.version;
  };
}
