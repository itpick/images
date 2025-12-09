{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for cert-manager-startupapicheck:

# cert-manager-startupapicheck uses cmctl to check API availability
mkImage {
  drv = pkgs.cmctl;
  name = "cert-manager-startupapicheck";
  tag = "v${pkgs.cmctl.version}";
  entrypoint = [ "${pkgs.cmctl}/bin/cmctl" ];
  cmd = [ "check" "api" "--wait=1m" ];
  # Chainguard runs cert-manager-startupapicheck as user 1000
  user = "1000:1000";

  labels = {
    "org.opencontainers.image.title" = "cert-manager Startup API Check";
    "org.opencontainers.image.description" = "API readiness check for cert-manager";
    "org.opencontainers.image.version" = pkgs.cmctl.version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
