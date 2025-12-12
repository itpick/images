{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-podman-exporter
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-podman-exporter";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "podman-exporter";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = prometheus-component;
  name = "prometheus-podman-exporter";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/podman-exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus podman exporter";
    "org.opencontainers.image.description" = "Prometheus prometheus-podman-exporter component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
