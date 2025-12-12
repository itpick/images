{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-jmx-exporter
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-jmx-exporter";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "jmx-exporter";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = prometheus-component;
  name = "prometheus-jmx-exporter";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/jmx-exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus jmx exporter";
    "org.opencontainers.image.description" = "Prometheus prometheus-jmx-exporter component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
