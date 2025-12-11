{ mkImage, pkgs, lib, ... }:

# kumactl - Kuma service mesh CLI
# https://kuma.io/

mkImage {
  drv = pkgs.kumactl;
  name = "kumactl";
  tag = "v${pkgs.kumactl.version}";
  entrypoint = [ "${pkgs.kumactl}/bin/kumactl" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "kumactl";
    "org.opencontainers.image.description" = "CLI for Kuma service mesh";
    "org.opencontainers.image.version" = pkgs.kumactl.version;
  };
}
