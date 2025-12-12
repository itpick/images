{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# prometheus-alertmanager-fips
# Prometheus ecosystem component

let
  version = "3.4.0";
  prometheus-component = buildGoModule {
    pname = "prometheus-alertmanager-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "prometheus";
      repo = "alertmanager";
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
  name = "prometheus-alertmanager-fips";
  tag = "v${version}";
  entrypoint = [ "${prometheus-component}/bin/alertmanager" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "prometheus alertmanager";
    "org.opencontainers.image.description" = "Prometheus prometheus-alertmanager component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "prometheus";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
