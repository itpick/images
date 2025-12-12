{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-es-index-cleaner
# Jaeger distributed tracing

let
  version = "2.0.0";
  component = buildGoModule {
    pname = "jaeger-es-index-cleaner";
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
  name = "jaeger-es-index-cleaner";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/jaeger-es-index-cleaner" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger-es-index-cleaner";
    "org.opencontainers.image.description" = "Jaeger jaeger-es-index-cleaner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
