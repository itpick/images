{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-redis-exporter-iamguarded
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-redis-exporter-iamguarded";
    inherit version;
    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "prometheus";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "prometheus-redis-exporter-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-redis-exporter-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-redis-exporter-iamguarded";
    "org.opencontainers.image.description" = "Prometheus prometheus-redis-exporter-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
