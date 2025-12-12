{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-state-metrics-iamguarded
# Kubernetes component

let
  version = "1.32.0";
  component = buildGoModule {
    pname = "kube-state-metrics-iamguarded";
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
  name = "kube-state-metrics-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kube-state-metrics-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kube-state-metrics-iamguarded";
    "org.opencontainers.image.description" = "Kubernetes kube-state-metrics-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
