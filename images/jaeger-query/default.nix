{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-query
# Jaeger distributed tracing

let
  version = "2.0.0";
  component = buildGoModule {
    pname = "jaeger-query";
    inherit version;
    src = fetchFromGitHub {
      owner = "jaegertracing";
      repo = "jaeger";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "jaeger-query";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/jaeger-query" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger-query";
    "org.opencontainers.image.description" = "Jaeger jaeger-query";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
