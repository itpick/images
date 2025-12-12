{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-admission-webhook
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-admission-webhook";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "admission-webhook";
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
  name = "prometheus-admission-webhook";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/admission-webhook" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus admission weuhook";
    "org.opencontainers.image.description" = "Prometheus prometheus-admission-webhook component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
  };
}
