{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-scheduler-fips
# Kubernetes component

let
  version = "1.34.0";
  kube-scheduler = buildGoModule {
    pname = "kube-scheduler-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/scheduler" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-scheduler;
  name = "kube-scheduler-fips";
  tag = "v${version}";
  entrypoint = [ "${kube-scheduler}/bin/scheduler" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue scheduler";
    "org.opencontainers.image.description" = "Kubernetes kube-scheduler";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
