{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-es-rollover-fips
# Jaeger distributed tracing

let
  version = "2.0.0";
  component = buildGoModule {
    pname = "jaeger-es-rollover-fips";
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
  name = "jaeger-es-rollover-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/jaeger-es-rollover" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger-es-rollover-fips";
    "org.opencontainers.image.description" = "Jaeger jaeger-es-rollover";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
