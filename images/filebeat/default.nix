# filebeat
# =============
# Filebeat - Lightweight log shipper
# https://www.elastic.co/beats/filebeat
#
# Filebeat is a lightweight shipper for forwarding and centralizing
# log data to Elasticsearch or Logstash.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.filebeat;
  name = "filebeat";
  tag = "v${pkgs.filebeat.version}";
  entrypoint = [ "${pkgs.filebeat}/bin/filebeat" ];
  cmd = [ "-e" ];

  extraPkgs = with pkgs; [
    bash
    coreutils
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Filebeat";
    "org.opencontainers.image.description" = "Lightweight log shipper for Elasticsearch";
    "org.opencontainers.image.version" = pkgs.filebeat.version;
  };
}
