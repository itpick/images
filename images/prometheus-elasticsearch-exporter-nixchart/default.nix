{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-elasticsearch-exporter-nixchart
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-elasticsearch-exporter-nixchart";
    inherit version;
    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "prometheus";
      rev = "v${version}";
      hash = "sha256-IMYDtAb2ojzZLBqRJkMcB8yFpmmJPwbbyAxFfbCikkA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "prometheus-elasticsearch-exporter-nixchart";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-elasticsearch-exporter-nixchart" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-elasticsearch-exporter-nixchart";
    "org.opencontainers.image.description" = "Prometheus prometheus-elasticsearch-exporter-nixchart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
