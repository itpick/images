{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-logging-operator
# Kubernetes component

let
  version = "1.34.0";
  kube-logging-operator = buildGoModule {
    pname = "kube-logging-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/logging-operator" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-logging-operator;
  name = "kube-logging-operator";
  tag = "v${version}";
  entrypoint = [ "${kube-logging-operator}/bin/logging-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue logging operator";
    "org.opencontainers.image.description" = "Kubernetes kube-logging-operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
