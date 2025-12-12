{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dashboard-api-fips
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dashboard-api = buildGoModule {
    pname = "kubernetes-dashboard-api-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dashboard-api" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dashboard-api;
  name = "kubernetes-dashboard-api-fips";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dashboard-api}/bin/dashboard-api" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dashuoard api";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dashboard-api";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
