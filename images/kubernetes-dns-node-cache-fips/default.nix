{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dns-node-cache-fips
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dns-node-cache = buildGoModule {
    pname = "kubernetes-dns-node-cache-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dns-node-cache" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dns-node-cache;
  name = "kubernetes-dns-node-cache-fips";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dns-node-cache}/bin/dns-node-cache" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dns node cache";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dns-node-cache";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
