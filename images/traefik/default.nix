{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for traefik:
# Packages available in nixpkgs:
#   pkgs.traefik  # traefik-3.6 (3.6.2-r2)

mkImage {
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
