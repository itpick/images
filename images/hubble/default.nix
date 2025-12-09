{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for hubble:
# Packages available in nixpkgs:
#   pkgs.hubble  # Network, Service & Security Observability for Kubernetes using eBPF

mkImage {
  drv = pkgs.hubble;
  name = "hubble";
  tag = "v${pkgs.hubble.version}";
  entrypoint = [ "${pkgs.hubble}/bin/hubble" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "Hubble";
    "org.opencontainers.image.description" = "Network, Service & Security Observability for Kubernetes using eBPF";
    "org.opencontainers.image.version" = pkgs.hubble.version;
    "io.nix-containers.chart" = "cilium";
  };
}
