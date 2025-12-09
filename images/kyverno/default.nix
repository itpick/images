{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for kyverno:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.kyverno  # kyverno-1.16 (1.16.1-r0)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)

mkImage {
  drv = pkgs.kyverno;
  name = "kyverno";
  tag = "v${pkgs.kyverno.version}";
  entrypoint = [ "${pkgs.kyverno}/bin/kyverno" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno";
    "org.opencontainers.image.description" = "Kubernetes native policy engine";
    "org.opencontainers.image.version" = pkgs.kyverno.version;
    "io.nix-containers.chart" = "kyverno";
  };
}
