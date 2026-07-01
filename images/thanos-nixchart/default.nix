{ mkImage, pkgs, lib, ... }:

# thanos-nixchart
# Runs Thanos; chart passes subcommand + flags via values.args.
mkImage {
  drv = pkgs.thanos;
  name = "thanos-nixchart";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ (lib.getExe pkgs.thanos) ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "thanos-nixchart";
    "org.opencontainers.image.description" = "Thanos tuned for the nix-containers charts/thanos chart";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.chart" = "thanos";
  };
}
