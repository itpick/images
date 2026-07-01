{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-operator-nixchart-fips
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-operator-nixchart-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "prometheus";
      rev = "v${version}";
      hash = "sha256-MgeisPFjNIIAU65MY0p2yS+3Gdfvorv1Jun139otOpc=";
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
  name = "prometheus-operator-nixchart-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-operator-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-operator-nixchart-fips";
    "org.opencontainers.image.description" = "Prometheus prometheus-operator-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
