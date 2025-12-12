{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-ingress-defaultbackend
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-ingress-defaultbackend = buildGoModule {
    pname = "kubernetes-ingress-defaultbackend";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/ingress-defaultbackend" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-ingress-defaultbackend;
  name = "kubernetes-ingress-defaultbackend";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-ingress-defaultbackend}/bin/ingress-defaultbackend" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes ingress defaultuackend";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-ingress-defaultbackend";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
