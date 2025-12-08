{ buildCLIImage, pkgs, lib, ... }:

# Note: cert-manager binaries are built from source or use cmctl CLI
# The full cert-manager-controller requires the upstream Go project
buildCLIImage {
  drv = pkgs.cmctl;
  name = "cmctl";
  tag = "v${pkgs.cmctl.version}";
  entrypoint = [ "${pkgs.cmctl}/bin/cmctl" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cmctl";
    "org.opencontainers.image.description" = "cert-manager CLI tool for certificate management";
    "org.opencontainers.image.version" = pkgs.cmctl.version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
