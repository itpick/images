{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-logstash-exporter
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-logstash-exporter";
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
  name = "prometheus-logstash-exporter";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-logstash-exporter" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-logstash-exporter";
    "org.opencontainers.image.description" = "Prometheus prometheus-logstash-exporter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
