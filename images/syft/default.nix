{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for syft:
# Packages available in nixpkgs:
#   pkgs.syft  # CLI tool and library for generating a Software Bill of Materials

mkImage {
  drv = pkgs.syft;
  name = "syft";
  tag = "v${pkgs.syft.version}";
  entrypoint = [ "${pkgs.syft}/bin/syft" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Syft";
    "org.opencontainers.image.description" = "CLI tool for generating a Software Bill of Materials from container images";
    "org.opencontainers.image.version" = pkgs.syft.version;
    "io.nix-containers.chart" = "syft";
  };
}
