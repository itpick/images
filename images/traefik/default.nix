{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for traefik:
# Packages available in nixpkgs:
#   pkgs.traefik  # traefik-3.6 (3.6.2-r2)

mkImage {
  drv = pkgs.traefik;
  name = "traefik";
  tag = "v${pkgs.traefik.version}";
  entrypoint = [ "${pkgs.traefik}/bin/traefik" ];
  # Was empty — traefik then defaults its `web` entrypoint to the privileged
  # :80, which mkImage's nonroot (65534) user can't bind, so it CrashLoops.
  # Move the entrypoints to >1024 ports (nonroot-bindable, all interfaces) and
  # turn on the dashboard/API + /ping so the image is a reachable, health-
  # checkable default with no providers configured. Operators mount their own
  # static config (providers, real entrypoints, ACME).
  cmd = [
    "--entrypoints.web.address=:8000"
    "--entrypoints.traefik.address=:8080"
    "--api.insecure=true"
    "--ping=true"
  ];

  labels = {
    "org.opencontainers.image.title" = "Traefik";
    "org.opencontainers.image.description" = "Cloud native application proxy and ingress controller";
    "org.opencontainers.image.version" = pkgs.traefik.version;
    "io.nix-containers.chart" = "traefik";
  };
}
