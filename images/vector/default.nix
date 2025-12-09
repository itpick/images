{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for vector:
# Packages available in nixpkgs:
#   pkgs.vector  # High-performance observability data pipeline

mkImage {
  drv = pkgs.vector;
  name = "vector";
  tag = "v${pkgs.vector.version}";
  entrypoint = [ "${pkgs.vector}/bin/vector" ];
  cmd = [ "--config" "/etc/vector/vector.toml" ];

  env = {
    VECTOR_CONFIG = "/etc/vector/vector.toml";
  };

  labels = {
    "org.opencontainers.image.title" = "Vector";
    "org.opencontainers.image.description" = "High-performance observability data pipeline for logs, metrics, and traces";
    "org.opencontainers.image.version" = pkgs.vector.version;
    "io.nix-containers.chart" = "vector";
  };
}
