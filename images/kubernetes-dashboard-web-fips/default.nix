{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dashboard-web-fips
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dashboard-web = buildGoModule {
    pname = "kubernetes-dashboard-web-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dashboard-web" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dashboard-web;
  name = "kubernetes-dashboard-web-fips";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dashboard-web}/bin/dashboard-web" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dashuoard web";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dashboard-web";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
