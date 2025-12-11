{ mkImage, pkgs, lib, ... }:

# pgAdmin 4 - PostgreSQL management tool
# https://www.pgadmin.org/

mkImage {
  drv = pkgs.pgadmin4;
  name = "pgadmin4";
  tag = "v${pkgs.pgadmin4.version}";
  entrypoint = [ "${pkgs.pgadmin4}/bin/pgadmin4" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "pgAdmin 4";
    "org.opencontainers.image.description" = "PostgreSQL management and administration tool";
    "org.opencontainers.image.version" = pkgs.pgadmin4.version;
  };
}
