{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.gatekeeper;
  name = "gatekeeper";
  tag = "v${pkgs.gatekeeper.version}";
  entrypoint = [ "${pkgs.gatekeeper}/bin/manager" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "OPA Gatekeeper";
    "org.opencontainers.image.description" = "Policy Controller for Kubernetes";
    "org.opencontainers.image.version" = pkgs.gatekeeper.version;
    "io.nix-containers.chart" = "gatekeeper";
  };
}
