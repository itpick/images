{ mkImage, pkgs, lib, ... }:

# ClickHouse - Column-oriented database for analytics
# https://clickhouse.com/

let
  # The cmd runs clickhouse-server with the package's /etc/clickhouse-server/
  # config.xml, but that config puts every path under /var/lib/clickhouse +
  # /var/log/clickhouse-server (which mkImage's nonroot user can't write) and
  # binds only ::1 / 127.0.0.1 — so the bare image CrashLoops. ClickHouse
  # auto-loads config.d/*.xml on top of config.xml; drop in an override that
  # relocates the data/tmp/user_files/format-schema/access/log dirs to the
  # writable /tmp and replaces listen_host with 0.0.0.0. (No setuid <user> in
  # the default config, and keeper/zookeeper are commented out, so nothing else
  # needs root.) Operators mount their own config + a PVC.
  nonrootOverride = pkgs.writeTextDir "etc/clickhouse-server/config.d/zz-nonroot-paths.xml" ''
    <clickhouse>
        <path>/tmp/clickhouse/</path>
        <tmp_path>/tmp/clickhouse/tmp/</tmp_path>
        <user_files_path>/tmp/clickhouse/user_files/</user_files_path>
        <format_schema_path>/tmp/clickhouse/format_schemas/</format_schema_path>
        <listen_host replace="replace">0.0.0.0</listen_host>
        <logger>
            <log>/tmp/clickhouse/clickhouse-server.log</log>
            <errorlog>/tmp/clickhouse/clickhouse-server.err.log</errorlog>
        </logger>
        <user_directories>
            <local_directory>
                <path>/tmp/clickhouse/access/</path>
            </local_directory>
        </user_directories>
    </clickhouse>
  '';

in
mkImage {
  drv = pkgs.clickhouse;
  name = "clickhouse";
  tag = "v${pkgs.clickhouse.version}";
  entrypoint = [ "${pkgs.clickhouse}/bin/clickhouse-server" ];
  cmd = [ "--config-file=/etc/clickhouse-server/config.xml" ];

  extraPkgs = with pkgs; [ cacert nonrootOverride ];

  labels = {
    "org.opencontainers.image.title" = "ClickHouse";
    "org.opencontainers.image.description" = "Column-oriented database management system for OLAP";
    "org.opencontainers.image.version" = pkgs.clickhouse.version;
  };
}
