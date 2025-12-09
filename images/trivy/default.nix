{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for trivy:
# Packages available in nixpkgs:
#   pkgs.trivy  # Simple and comprehensive vulnerability scanner for containers

mkImage {
  drv = pkgs.trivy;
  name = "trivy";
  tag = "v${pkgs.trivy.version}";
  entrypoint = [ "${pkgs.trivy}/bin/trivy" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Trivy";
    "org.opencontainers.image.description" = "Simple and comprehensive vulnerability scanner for containers, suitable for CI";
    "org.opencontainers.image.version" = pkgs.trivy.version;
    "io.nix-containers.chart" = "trivy";
  };
}
