{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-logging-operator-config-reloader
# Kubernetes component

let
  version = "1.34.0";
  kube-logging-operator-config-reloader = buildGoModule {
    pname = "kube-logging-operator-config-reloader";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/logging-operator-config-reloader" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-logging-operator-config-reloader;
  name = "kube-logging-operator-config-reloader";
  tag = "v${version}";
  entrypoint = [ "${kube-logging-operator-config-reloader}/bin/logging-operator-config-reloader" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue logging operator config reloader";
    "org.opencontainers.image.description" = "Kubernetes kube-logging-operator-config-reloader";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
