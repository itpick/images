{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-mysqld-exporter-iamguarded
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-mysqld-exporter-iamguarded";
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
  name = "prometheus-mysqld-exporter-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-mysqld-exporter-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-mysqld-exporter-iamguarded";
    "org.opencontainers.image.description" = "Prometheus prometheus-mysqld-exporter-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
