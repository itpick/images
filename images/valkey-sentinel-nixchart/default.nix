{ mkImage, pkgs, lib, ... }:
mkImage {
  drv = pkgs.buildEnv {
    name = "valkey-sentinel-nixchart-env";
    paths = with pkgs; [ valkey bash coreutils cacert tzdata ];
  };
  name = "valkey-sentinel-nixchart";
  tag = "v${pkgs.valkey.version}";
  entrypoint = [ "${pkgs.valkey}/bin/valkey-sentinel" ];
  cmd = [];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "valkey-sentinel-nixchart";
  labels."org.opencontainers.image.description" = "Valkey Sentinel for the nix-containers charts/valkey chart";
  labels."org.opencontainers.image.version" = pkgs.valkey.version;
  labels."io.nix-containers.chart" = "valkey";
}
