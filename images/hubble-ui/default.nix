{ mkImage, pkgs, lib, ... }:

# Hubble UI - Web interface for Cilium Hubble observability
# https://github.com/cilium/hubble-ui
# Note: This builds the backend service. The frontend static files
# would typically be served via nginx or built into the backend.

mkImage {
  drv = pkgs.hubble-ui.hubble-ui-backend;
  name = "hubble-ui";
  tag = "v${pkgs.hubble-ui.version}";
  entrypoint = [ "${pkgs.hubble-ui.hubble-ui-backend}/bin/backend" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Hubble UI";
    "org.opencontainers.image.description" = "Web interface for Cilium Hubble network observability";
    "org.opencontainers.image.version" = pkgs.hubble-ui.version;
    "io.nix-containers.chart" = "cilium";
  };
}
