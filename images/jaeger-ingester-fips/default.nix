{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-ingester-fips
# Jaeger distributed tracing

let
  version = "2.0.0";
  component = buildGoModule {
    pname = "jaeger-ingester-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "jaegertracing";
      repo = "jaeger";
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

in mkImage {
  drv = component;
  name = "jaeger-ingester-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/jaeger-ingester" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger-ingester-fips";
    "org.opencontainers.image.description" = "Jaeger jaeger-ingester";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
