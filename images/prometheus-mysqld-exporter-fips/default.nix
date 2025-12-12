{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-mysqld-exporter-fips
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-mysqld-exporter-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "mysqld-exporter";
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
  name = "prometheus-mysqld-exporter-fips";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/mysqld-exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus mysqld exporter";
    "org.opencontainers.image.description" = "Prometheus prometheus-mysqld-exporter component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
