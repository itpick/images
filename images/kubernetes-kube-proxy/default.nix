{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-kube-proxy
# Kubernetes component

let
  version = "1.32.0";
  component = buildGoModule {
    pname = "kubernetes-kube-proxy";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "kubernetes-kube-proxy";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kubernetes-kube-proxy" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubernetes-kube-proxy";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-kube-proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
