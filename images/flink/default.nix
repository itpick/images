{ mkImage, pkgs, lib, ... }:

# Apache Flink - Stream processing framework
# https://flink.apache.org/

mkImage {
  drv = pkgs.flink;
  name = "flink";
  tag = "v${pkgs.flink.version}";
  entrypoint = [ "${pkgs.flink}/bin/flink" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Apache Flink";
    "org.opencontainers.image.description" = "Distributed stream processing framework";
    "org.opencontainers.image.version" = pkgs.flink.version;
  };
}
