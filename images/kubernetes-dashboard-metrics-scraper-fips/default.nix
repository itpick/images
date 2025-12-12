{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dashboard-metrics-scraper-fips
# Kubernetes component

let
  version = "1.32.0";
  component = buildGoModule {
    pname = "kubernetes-dashboard-metrics-scraper-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "kubernetes-dashboard-metrics-scraper-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kubernetes-dashboard-metrics-scraper" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kubernetes-dashboard-metrics-scraper-fips";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dashboard-metrics-scraper";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
