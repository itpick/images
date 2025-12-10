# istio-pilot (istiod control plane)
# https://istio.io/

{ mkImage, pkgs, lib, ... }:

let
  istio = pkgs.istio;
  version = istio.version;
in
mkImage {
  drv = istio.pilot-discovery;
  name = "istio-pilot";
  tag = version;
  entrypoint = [ "${istio.pilot-discovery}/bin/pilot-discovery" ];
  cmd = [ "discovery" ];

  extraPkgs = with pkgs; [
    busybox
    cacert
    iptables
  ];

  env = {
    # Istio configuration
    PILOT_TRACE_SAMPLING = "1.0";
  };

  labels = {
    "org.opencontainers.image.title" = "Istio Pilot";
    "org.opencontainers.image.description" = "Istio control plane (istiod)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "istio";
  };
}
