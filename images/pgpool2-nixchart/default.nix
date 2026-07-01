{ mkImage, pkgs, lib, ... }:
mkImage {
  drv = pkgs.pgpool;
  name = "pgpool2-nixchart";
  tag = "v${pkgs.pgpool.version}";
  entrypoint = [ "${pkgs.pgpool}/bin/pgpool" ];
  cmd = [ "-n" "-f" "/config/pgpool.conf" ];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "pgpool2-nixchart";
  labels."org.opencontainers.image.description" = "pgpool for the nix-containers charts/postgresql-ha chart";
  labels."org.opencontainers.image.version" = pkgs.pgpool.version;
  labels."io.nix-containers.chart" = "postgresql-ha";
}
