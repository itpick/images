{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-pushgateway-iamguarded
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-pushgateway-iamguarded";
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
  name = "prometheus-pushgateway-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-pushgateway-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-pushgateway-iamguarded";
    "org.opencontainers.image.description" = "Prometheus prometheus-pushgateway-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
