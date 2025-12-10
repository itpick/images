# istio-proxyv2 (Envoy sidecar proxy)
# https://istio.io/
#
# This image contains:
# - pilot-agent: Manages Envoy configuration (from pre-built binary)
# - envoy: The actual proxy (from pre-built binary)
#
# Note: We use pre-built binaries from the official Istio Docker image
# because Envoy doesn't build on aarch64-linux in nixpkgs (bazel issues)

{ mkImage, pkgs, lib, ... }:

let
  istio = pkgs.istio;
  version = istio.version;
in
mkImage {
  drv = istio.proxyv2-bin;
  name = "istio-proxyv2";
  tag = version;
  entrypoint = [ "${istio.proxyv2-bin}/bin/pilot-agent" ];
  cmd = [ "proxy" "sidecar" ];

  extraPkgs = with pkgs; [
    cacert
    iptables
    iproute2
  ];

  noBusybox = true;  # iproute2 conflicts with busybox

  env = {
    PATH = "/bin:${pkgs.iptables}/bin:${pkgs.iproute2}/bin";
  };

  labels = {
    "org.opencontainers.image.title" = "Istio Proxy";
    "org.opencontainers.image.description" = "Istio sidecar proxy (Envoy)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "istio";
  };
}
