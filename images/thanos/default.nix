{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for thanos:
# Packages available in nixpkgs:
#   pkgs.thanos  # thanos (0.40.1-r1)

mkImage {
  drv = pkgs.thanos;
  name = "thanos";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ "${pkgs.thanos}/bin/thanos" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Thanos";
    "org.opencontainers.image.description" = "Highly available Prometheus setup with long-term storage";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
