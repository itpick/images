{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-alertmanager-iamguarded
# Prometheus ecosystem component

let
  version = "3.0.0";
  component = buildGoModule {
    pname = "prometheus-alertmanager-iamguarded";
    inherit version;
    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "prometheus";
      rev = "v${version}";
      hash = "sha256-IMYDtAb2ojzZLBqRJkMcB8yFpmmJPwbbyAxFfbCikkA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "prometheus-alertmanager-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/prometheus-alertmanager-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "prometheus-alertmanager-iamguarded";
    "org.opencontainers.image.description" = "Prometheus prometheus-alertmanager-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
