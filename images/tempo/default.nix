{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for tempo:
# Packages available in nixpkgs:
#   pkgs.tempo  # tempo (2.9.0-r3)

mkImage {
  drv = pkgs.tempo;
  name = "tempo";
  tag = pkgs.tempo.version;
  entrypoint = [ "${pkgs.tempo}/bin/tempo" ];
  cmd = [ ];

  extraPkgs = with pkgs; [
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Grafana Tempo";
    "org.opencontainers.image.description" = "Open source distributed tracing backend";
    "org.opencontainers.image.version" = pkgs.tempo.version;
    "io.nix-containers.chart" = "tempo";
  };
}
