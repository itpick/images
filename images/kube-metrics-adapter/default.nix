{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-metrics-adapter
# Kubernetes component

let
  version = "1.34.0";
  kube-metrics-adapter = buildGoModule {
    pname = "kube-metrics-adapter";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/metrics-adapter" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-metrics-adapter;
  name = "kube-metrics-adapter";
  tag = "v${version}";
  entrypoint = [ "${kube-metrics-adapter}/bin/metrics-adapter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue metrics adapter";
    "org.opencontainers.image.description" = "Kubernetes kube-metrics-adapter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
