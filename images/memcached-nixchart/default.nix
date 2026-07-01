{ mkImage, pkgs, lib, ... }:

# memcached-nixchart
# ==================
# Memcached image sized for consumption by the charts/memcached chart.
# Small: nixpkgs.memcached + defaults.
#
# Chart contract: the chart doesn't set command/args by default, so the
# image's entrypoint runs directly. Users can pass any memcached CLI
# flags via `command:` / `args:` overrides in values.yaml.

mkImage {
  drv = pkgs.memcached;
  name = "memcached-nixchart";
  tag = "v${pkgs.memcached.version}";

  entrypoint = [ (lib.getExe pkgs.memcached) ];
  # Sane defaults for k8s deployment: bind all interfaces, 11211, 64MB.
  cmd = [ "-l" "0.0.0.0" "-p" "11211" "-m" "64" ];

  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "memcached-nixchart";
    "org.opencontainers.image.description" = "Memcached image tuned for the nix-containers charts/memcached chart";
    "org.opencontainers.image.version" = pkgs.memcached.version;
    "io.nix-containers.chart" = "memcached";
  };
}
