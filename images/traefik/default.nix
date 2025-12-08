{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.traefik;
  name = "traefik";
  tag = "v${pkgs.traefik.version}";
  entrypoint = [ "${pkgs.traefik}/bin/traefik" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Traefik";
    "org.opencontainers.image.description" = "Cloud native application proxy and ingress controller";
    "org.opencontainers.image.version" = pkgs.traefik.version;
    "io.nix-containers.chart" = "traefik";
  };
}
