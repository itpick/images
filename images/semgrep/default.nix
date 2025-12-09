{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for semgrep:
# Packages available in nixpkgs:
#   pkgs.semgrep  # Lightweight static analysis for many languages

mkImage {
  drv = pkgs.semgrep;
  name = "semgrep";
  tag = "v${pkgs.semgrep.version}";
  entrypoint = [ "${pkgs.semgrep}/bin/semgrep" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "Semgrep";
    "org.opencontainers.image.description" = "Lightweight static analysis for many languages";
    "org.opencontainers.image.version" = pkgs.semgrep.version;
    "io.nix-containers.chart" = "semgrep";
  };
}
