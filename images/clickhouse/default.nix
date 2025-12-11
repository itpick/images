{ mkImage, pkgs, lib, ... }:

# ClickHouse - Column-oriented database for analytics
# https://clickhouse.com/

mkImage {
  drv = pkgs.clickhouse;
  name = "clickhouse";
  tag = "v${pkgs.clickhouse.version}";
  entrypoint = [ "${pkgs.clickhouse}/bin/clickhouse-server" ];
  cmd = [ "--config-file=/etc/clickhouse-server/config.xml" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "ClickHouse";
    "org.opencontainers.image.description" = "Column-oriented database management system for OLAP";
    "org.opencontainers.image.version" = pkgs.clickhouse.version;
  };
}
