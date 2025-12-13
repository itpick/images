{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-dashboard-metrics-scraper
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-dashboard-metrics-scraper = buildGoModule {
    pname = "kubernetes-dashboard-metrics-scraper";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/dashboard-metrics-scraper" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-dashboard-metrics-scraper;
  name = "kubernetes-dashboard-metrics-scraper";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-dashboard-metrics-scraper}/bin/dashboard-metrics-scraper" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes dashuoard metrics scraper";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-dashboard-metrics-scraper";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
