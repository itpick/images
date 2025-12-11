{ mkImage, pkgs, lib, ... }:

# Neo4j - Graph database
# https://neo4j.com/

mkImage {
  drv = pkgs.neo4j;
  name = "neo4j";
  tag = "v${pkgs.neo4j.version}";
  entrypoint = [ "${pkgs.neo4j}/bin/neo4j" ];
  cmd = [ "console" ];

  extraPkgs = with pkgs; [ openjdk21_headless bash coreutils ];

  labels = {
    "org.opencontainers.image.title" = "Neo4j";
    "org.opencontainers.image.description" = "Native graph database management system";
    "org.opencontainers.image.version" = pkgs.neo4j.version;
  };
}
