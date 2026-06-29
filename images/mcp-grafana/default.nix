{ mkImage, pkgs, lib, ... }:

# mcp-grafana
# Container image packaging nixpkgs.mcp-grafana
mkImage {
  drv = pkgs.mcp-grafana;
  name = "mcp-grafana";
  tag = "v${pkgs.mcp-grafana.version}";
  entrypoint = [ (lib.getExe pkgs.mcp-grafana) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "mcp-grafana";
    "org.opencontainers.image.description" = "mcp-grafana container image (nixpkgs.mcp-grafana)";
    "org.opencontainers.image.version" = pkgs.mcp-grafana.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
