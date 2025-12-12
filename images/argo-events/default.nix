{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.argo-events;
  name = "argo-events";
  tag = "v${pkgs.argo-events.version}";
  entrypoint = [ "${pkgs.argo-events}/bin/argo-events" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Argo Events";
    "org.opencontainers.image.description" = "Event-driven workflow automation framework for Kubernetes";
    "org.opencontainers.image.version" = pkgs.argo-events.version;
    "io.nix-containers.chart" = "argo-events";
  };
}
