{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-statsd-exporter-nixchart
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-statsd-exporter-nixchart";
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
  name = "prometheus-statsd-exporter-nixchart";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-statsd-exporter-nixchart" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-statsd-exporter-nixchart";
    "org.opencontainers.image.description" = "Prometheus prometheus-statsd-exporter-nixchart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
