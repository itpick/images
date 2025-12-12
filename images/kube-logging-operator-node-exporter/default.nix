{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-logging-operator-node-exporter
# Kubernetes component

let
  version = "1.34.0";
  kube-logging-operator-node-exporter = buildGoModule {
    pname = "kube-logging-operator-node-exporter";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/logging-operator-node-exporter" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-logging-operator-node-exporter;
  name = "kube-logging-operator-node-exporter";
  tag = "v${version}";
  entrypoint = [ "${kube-logging-operator-node-exporter}/bin/logging-operator-node-exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue logging operator node exporter";
    "org.opencontainers.image.description" = "Kubernetes kube-logging-operator-node-exporter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
