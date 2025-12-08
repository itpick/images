{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.tempo;
  name = "tempo";
  tag = pkgs.tempo.version;
  entrypoint = [ "${pkgs.tempo}/bin/tempo" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Tempo";
    "org.opencontainers.image.description" = "Open source distributed tracing backend";
    "org.opencontainers.image.version" = pkgs.tempo.version;
    "io.nix-containers.chart" = "tempo";
  };
}
