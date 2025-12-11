{ mkImage, pkgs, lib, ... }:

# Apache Druid - Real-time analytics database
# https://druid.apache.org/

mkImage {
  drv = pkgs.druid;
  name = "druid";
  tag = "v${pkgs.druid.version}";
  entrypoint = [ "${pkgs.druid}/bin/start-druid" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Apache Druid";
    "org.opencontainers.image.description" = "Real-time analytics database";
    "org.opencontainers.image.version" = pkgs.druid.version;
  };
}
