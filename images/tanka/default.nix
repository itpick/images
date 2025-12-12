{ mkImage, pkgs, lib, ... }:

# Tanka - Kubernetes configuration with Jsonnet
# https://tanka.dev/

mkImage {
  drv = pkgs.tanka;
  name = "tanka";
  tag = "v${pkgs.tanka.version}";
  entrypoint = [ "${pkgs.tanka}/bin/tk" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Tanka";
    "org.opencontainers.image.description" = "Flexible, reusable and concise configuration for Kubernetes";
    "org.opencontainers.image.version" = pkgs.tanka.version;
  };
}
