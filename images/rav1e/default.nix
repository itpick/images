{ mkImage, pkgs, lib, ... }:

# rav1e - AV1 video encoder
# https://github.com/xiph/rav1e

mkImage {
  drv = pkgs.rav1e;
  name = "rav1e";
  tag = "v${pkgs.rav1e.version}";
  entrypoint = [ "${pkgs.rav1e}/bin/rav1e" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "rav1e";
    "org.opencontainers.image.description" = "Fastest and safest AV1 encoder";
    "org.opencontainers.image.version" = pkgs.rav1e.version;
  };
}
