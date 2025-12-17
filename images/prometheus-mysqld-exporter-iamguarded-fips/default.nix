{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-mysqld-exporter-iamguarded-fips
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-mysqld-exporter-iamguarded-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "prometheus";
      rev = "v${version}";
      hash = "sha256-IMYDtAb2ojzZLBqRJkMcB8yFpmmJPwbbyAxFfbCikkA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "prometheus-mysqld-exporter-iamguarded-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-mysqld-exporter-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-mysqld-exporter-iamguarded-fips";
    "org.opencontainers.image.description" = "Prometheus prometheus-mysqld-exporter-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
