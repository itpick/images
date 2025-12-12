{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-pushgateway-fips
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-pushgateway-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "pushgateway";
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
  name = "prometheus-pushgateway-fips";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/pushgateway" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus pushgateway";
    "org.opencontainers.image.description" = "Prometheus prometheus-pushgateway component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
