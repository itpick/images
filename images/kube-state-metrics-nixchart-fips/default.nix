{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-state-metrics-nixchart-fips
# Kubernetes component

let
  version = "1.32.0";
  component = buildGoModule {
    pname = "kube-state-metrics-nixchart-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
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
  name = "kube-state-metrics-nixchart-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/kube-state-metrics-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "kube-state-metrics-nixchart-fips";
    "org.opencontainers.image.description" = "Kubernetes kube-state-metrics-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
