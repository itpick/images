{ mkImage, pkgs, lib, ... }:

# Liquibase - Database schema change management
# https://www.liquibase.org/

mkImage {
  drv = pkgs.liquibase;
  name = "liquibase";
  tag = "v${pkgs.liquibase.version}";
  entrypoint = [ "${pkgs.liquibase}/bin/liquibase" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ openjdk21_headless bash ];

  labels = {
    "org.opencontainers.image.title" = "Liquibase";
    "org.opencontainers.image.description" = "Database schema change management tool";
    "org.opencontainers.image.version" = pkgs.liquibase.version;
  };
}
