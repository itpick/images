{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for act:
# Packages available in nixpkgs:
#   pkgs.act  # Run your GitHub Actions locally

mkImage {
  drv = pkgs.act;
  name = "act";
  tag = "v${pkgs.act.version}";
  entrypoint = [ "${pkgs.act}/bin/act" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "act";
    "org.opencontainers.image.description" = "Run your GitHub Actions locally";
    "org.opencontainers.image.version" = pkgs.act.version;
    "io.nix-containers.chart" = "act";
  };
}
