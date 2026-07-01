{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-operator-nixchart
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-operator-nixchart";
    inherit version;
    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "prometheus";
      rev = "v${version}";
      hash = "sha256-MgeisPFjNIIAU65MY0p2yS+3Gdfvorv1Jun139otOpc=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "prometheus-operator-nixchart";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-operator-nixchart" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-operator-nixchart";
    "org.opencontainers.image.description" = "Prometheus prometheus-operator-nixchart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
