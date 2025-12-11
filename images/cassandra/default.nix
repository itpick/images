{ mkImage, pkgs, lib, ... }:

# Apache Cassandra - Distributed NoSQL database
# https://cassandra.apache.org/

mkImage {
  drv = pkgs.cassandra;
  name = "cassandra";
  tag = "v${pkgs.cassandra.version}";
  entrypoint = [ "${pkgs.cassandra}/bin/cassandra" ];
  cmd = [ "-f" ];

  extraPkgs = with pkgs; [ openjdk21_headless bash coreutils ];

  labels = {
    "org.opencontainers.image.title" = "Apache Cassandra";
    "org.opencontainers.image.description" = "Distributed NoSQL database management system";
    "org.opencontainers.image.version" = pkgs.cassandra.version;
  };
}
