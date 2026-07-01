{ mkImage, pkgs, lib, ... }:

# clickhouse-nixchart
# ===================
# ClickHouse for consumption by the charts/clickhouse chart.
# Chart mounts /etc/clickhouse-server/config.d/ via ConfigMap.

mkImage {
  drv = pkgs.clickhouse;
  name = "clickhouse-nixchart";
  tag = "v${pkgs.clickhouse.version}";
  entrypoint = [ "${pkgs.clickhouse}/bin/clickhouse" ];
  cmd = [ "server" "--config-file=/etc/clickhouse-server/config.xml" ];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "clickhouse-nixchart";
    "org.opencontainers.image.description" = "ClickHouse tuned for the nix-containers charts/clickhouse chart";
    "org.opencontainers.image.version" = pkgs.clickhouse.version;
    "io.nix-containers.chart" = "clickhouse";
  };
}
