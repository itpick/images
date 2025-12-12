{ mkImage, pkgs, lib, ... }:

# lazysql - Terminal SQL client
# https://github.com/jorgerojas26/lazysql

mkImage {
  drv = pkgs.lazysql;
  name = "lazysql";
  tag = "v${pkgs.lazysql.version}";
  entrypoint = [ "${pkgs.lazysql}/bin/lazysql" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "lazysql";
    "org.opencontainers.image.description" = "Terminal UI for database management";
    "org.opencontainers.image.version" = pkgs.lazysql.version;
  };
}
