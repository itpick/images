{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-yet-another-cloudwatch-exporter-fips
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-yet-another-cloudwatch-exporter-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "prometheus";
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

in mkImage {
  drv = component;
  name = "prometheus-yet-another-cloudwatch-exporter-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-yet-another-cloudwatch-exporter" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-yet-another-cloudwatch-exporter-fips";
    "org.opencontainers.image.description" = "Prometheus prometheus-yet-another-cloudwatch-exporter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
