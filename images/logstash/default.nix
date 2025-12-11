{ mkImage, pkgs, lib, ... }:

# Logstash - Server-side data processing pipeline
# https://www.elastic.co/logstash

mkImage {
  drv = pkgs.logstash;
  name = "logstash";
  tag = "v${pkgs.logstash.version}";
  entrypoint = [ "${pkgs.logstash}/bin/logstash" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Logstash";
    "org.opencontainers.image.description" = "Server-side data processing pipeline for ingesting data";
    "org.opencontainers.image.version" = pkgs.logstash.version;
  };
}
