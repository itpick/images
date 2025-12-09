{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for renovate:
# Packages available in nixpkgs:
#   pkgs.renovate  # Cross-platform Dependency Automation by Mend.io

mkImage {
  drv = pkgs.renovate;
  name = "renovate";
  tag = "v${pkgs.renovate.version}";
  entrypoint = [ "${pkgs.renovate}/bin/renovate" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ git cacert ];

  labels = {
    "org.opencontainers.image.title" = "Renovate";
    "org.opencontainers.image.description" = "Cross-platform Dependency Automation";
    "org.opencontainers.image.version" = pkgs.renovate.version;
    "io.nix-containers.chart" = "renovate";
  };
}
