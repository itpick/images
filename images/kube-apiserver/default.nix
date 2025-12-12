{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-apiserver
# Kubernetes component

let
  version = "1.34.0";
  kube-apiserver = buildGoModule {
    pname = "kube-apiserver";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/apiserver" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-apiserver;
  name = "kube-apiserver";
  tag = "v${version}";
  entrypoint = [ "${kube-apiserver}/bin/apiserver" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue apiserver";
    "org.opencontainers.image.description" = "Kubernetes kube-apiserver";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
