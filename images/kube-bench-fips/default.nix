{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-bench-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-bench = buildGoModule {
    pname = "kube-bench-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/bench" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-bench;
  name = "kube-bench-fips";
  tag = "v${version}";
  entrypoint = [ "${kube-bench}/bin/bench" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue uench";
    "org.opencontainers.image.description" = "Kubernetes kube-bench";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
