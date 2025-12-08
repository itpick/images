{ buildCLIImage, pkgs, lib, ... }:

# Flux CLI - Command line tool for Flux CD
buildCLIImage {
  drv = pkgs.fluxcd;
  name = "flux-cli";
  tag = "v${pkgs.fluxcd.version}";
  entrypoint = [ "${pkgs.fluxcd}/bin/flux" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux CLI";
    "org.opencontainers.image.description" = "Command line tool for managing Flux CD";
    "org.opencontainers.image.version" = pkgs.fluxcd.version;
    "io.nix-containers.chart" = "flux2";
  };
}
