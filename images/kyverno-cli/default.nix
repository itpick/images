{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for kyverno-cli:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)
#   kyverno-cli-1.16 (1.16.1-r0)

# kyverno-cli uses the same package as kyverno, but different binary
mkImage {
  drv = pkgs.kyverno;
  name = "kyverno-cli";
  tag = "v${pkgs.kyverno.version}";
  entrypoint = [ "${pkgs.kyverno}/bin/kyverno-cli" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno CLI";
    "org.opencontainers.image.description" = "Kyverno command-line interface for policy validation";
    "org.opencontainers.image.version" = pkgs.kyverno.version;
    "io.nix-containers.chart" = "kyverno";
  };
}
