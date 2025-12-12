{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-all-in-one-fips
# Jaeger distributed tracing

let
  version = "2.0.0";
  component = buildGoModule {
    pname = "jaeger-all-in-one-fips";
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
  name = "jaeger-all-in-one-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/jaeger-all-in-one" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger-all-in-one-fips";
    "org.opencontainers.image.description" = "Jaeger jaeger-all-in-one";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
