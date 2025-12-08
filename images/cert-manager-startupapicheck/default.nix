{ buildCLIImage, pkgs, lib, ... }:

# cert-manager-startupapicheck uses cmctl to check API availability
buildCLIImage {
  drv = pkgs.cmctl;
  name = "cert-manager-startupapicheck";
  tag = "v${pkgs.cmctl.version}";
  entrypoint = [ "${pkgs.cmctl}/bin/cmctl" ];
  cmd = [ "check" "api" "--wait=1m" ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager Startup API Check";
    "org.opencontainers.image.description" = "API readiness check for cert-manager";
    "org.opencontainers.image.version" = pkgs.cmctl.version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
