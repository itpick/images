{ mkImage, pkgs, lib, ... }:

# ProxySQL - High-performance MySQL proxy
# https://proxysql.com/

mkImage {
  drv = pkgs.proxysql;
  name = "proxysql";
  tag = "v${pkgs.proxysql.version}";
  entrypoint = [ "${pkgs.proxysql}/bin/proxysql" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ProxySQL";
    "org.opencontainers.image.description" = "High-performance MySQL proxy";
    "org.opencontainers.image.version" = pkgs.proxysql.version;
  };
}
