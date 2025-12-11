# auditbeat
# =============
# Auditbeat - Elastic audit data shipper
# https://www.elastic.co/beats/auditbeat
#
# Auditbeat collects audit data from your hosts and ships it to
# Elasticsearch or Logstash for analysis.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.auditbeat;
  name = "auditbeat";
  tag = "v${pkgs.auditbeat.version}";
  entrypoint = [ "${pkgs.auditbeat}/bin/auditbeat" ];
  cmd = [ "-e" ];

  extraPkgs = with pkgs; [
    bash
    coreutils
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Auditbeat";
    "org.opencontainers.image.description" = "Elastic audit data shipper for security monitoring";
    "org.opencontainers.image.version" = pkgs.auditbeat.version;
  };
}
