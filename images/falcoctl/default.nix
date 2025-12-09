{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for falcoctl:
# Packages available in nixpkgs:
#   pkgs.falcoctl  # Administrative tooling for Falco

mkImage {
  drv = pkgs.falcoctl;
  name = "falcoctl";
  tag = "v${pkgs.falcoctl.version}";
  entrypoint = [ "${pkgs.falcoctl}/bin/falcoctl" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "falcoctl";
    "org.opencontainers.image.description" = "Administrative tooling for Falco runtime security";
    "org.opencontainers.image.version" = pkgs.falcoctl.version;
    "io.nix-containers.chart" = "falco";
  };
}
