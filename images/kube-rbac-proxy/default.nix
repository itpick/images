{ mkImage, pkgs, lib, ... }:

# Uses kube-rbac-proxy package from pkgs/kube-rbac-proxy
# Built from wolfi-dev/os kube-rbac-proxy.yaml
# https://github.com/brancz/kube-rbac-proxy

let
  kube-rbac-proxy = pkgs.kube-rbac-proxy;
  version = kube-rbac-proxy.version;
in
mkImage {
  drv = kube-rbac-proxy;
  name = "kube-rbac-proxy";
  tag = "v${version}";
  entrypoint = [ "${kube-rbac-proxy}/bin/kube-rbac-proxy" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "kube-rbac-proxy";
    "org.opencontainers.image.description" = "Kubernetes RBAC authorizing HTTP proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack,dragonfly-operator";
  };
}
