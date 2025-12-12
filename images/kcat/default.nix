{ mkImage, pkgs, lib, ... }:

# kcat - Apache Kafka producer and consumer tool
# https://github.com/edenhill/kcat

mkImage {
  drv = pkgs.kcat;
  name = "kcat";
  tag = "v${pkgs.kcat.version}";
  entrypoint = [ "${pkgs.kcat}/bin/kcat" ];
  cmd = [ "-V" ];

  labels = {
    "org.opencontainers.image.title" = "kcat";
    "org.opencontainers.image.description" = "Generic command line non-JVM Apache Kafka producer and consumer";
    "org.opencontainers.image.version" = pkgs.kcat.version;
  };
}
