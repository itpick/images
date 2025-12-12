{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-arangodb
# Kubernetes component

let
  version = "1.34.0";
  kube-arangodb = buildGoModule {
    pname = "kube-arangodb";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/arangodb" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-arangodb;
  name = "kube-arangodb";
  tag = "v${version}";
  entrypoint = [ "${kube-arangodb}/bin/arangodb" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue arangodb";
    "org.opencontainers.image.description" = "Kubernetes kube-arangodb";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
