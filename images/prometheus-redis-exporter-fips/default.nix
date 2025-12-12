{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-redis-exporter-fips
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-redis-exporter-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "redis-exporter";
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

in
mkImage {
  drv = prometheus-component;
  name = "prometheus-redis-exporter-fips";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/redis-exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus redis exporter";
    "org.opencontainers.image.description" = "Prometheus prometheus-redis-exporter component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
