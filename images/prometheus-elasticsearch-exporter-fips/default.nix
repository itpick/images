{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-elasticsearch-exporter-fips
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-elasticsearch-exporter-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "elasticsearch-exporter";
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
  name = "prometheus-elasticsearch-exporter-fips";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/elasticsearch-exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus elasticsearch exporter";
    "org.opencontainers.image.description" = "Prometheus prometheus-elasticsearch-exporter component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
