{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-config-reloader-fips
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-config-reloader-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "config-reloader";
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

in
mkImage {
  drv = prometheus-component;
  name = "prometheus-config-reloader-fips";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/config-reloader" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus config reloader";
    "org.opencontainers.image.description" = "Prometheus prometheus-config-reloader component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
