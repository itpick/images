{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for vector:
# Packages available in nixpkgs:
#   pkgs.vector  # High-performance observability data pipeline

mkImage {
  drv = pkgs.vector;
  name = "vector";
  tag = "v${pkgs.vector.version}";
  entrypoint = [ "${pkgs.vector}/bin/vector" ];
  # Intentionally no Cmd. The helm chart's container spec sets
  # `args: ["--config-dir", "/etc/vector/"]` (or similar) and mounts a
  # configmap into /etc/vector with the actual config file(s). Don't
  # pin a hardcoded config path here, and don't set VECTOR_CONFIG --
  # vector binaries treat VECTOR_CONFIG as a SPECIFIC file path and
  # the chart usually ships `.yaml`, so setting VECTOR_CONFIG to
  # `/etc/vector/vector.toml` (as we did previously) tells the binary
  # to ignore the chart's --config-dir args and fail with:
  #   ERROR vector::config::loading: Config file not found in path.
  #     path="/etc/vector/vector.toml"
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Vector";
    "org.opencontainers.image.description" = "High-performance observability data pipeline for logs, metrics, and traces";
    "org.opencontainers.image.version" = pkgs.vector.version;
    "io.nix-containers.chart" = "vector";
  };
}
