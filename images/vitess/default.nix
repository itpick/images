{ mkImage, pkgs, lib, ... }:

# Vitess - Database clustering for MySQL
# https://vitess.io/

mkImage {
  drv = pkgs.vitess;
  name = "vitess";
  tag = "v${pkgs.vitess.version}";
  entrypoint = [ "${pkgs.vitess}/bin/vtgate" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Vitess";
    "org.opencontainers.image.description" = "Database clustering system for horizontal scaling of MySQL";
    "org.opencontainers.image.version" = pkgs.vitess.version;
  };
}
