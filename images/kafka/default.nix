{ mkImage, pkgs, lib, ... }:

# Apache Kafka - Distributed event streaming platform
# https://kafka.apache.org/

mkImage {
  drv = pkgs.apacheKafka;
  name = "kafka";
  tag = "v${pkgs.apacheKafka.version}";
  entrypoint = [ "${pkgs.apacheKafka}/bin/kafka-server-start.sh" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Apache Kafka";
    "org.opencontainers.image.description" = "Distributed event streaming platform";
    "org.opencontainers.image.version" = pkgs.apacheKafka.version;
  };
}
