{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-2-anonymizer
# Jaeger distributed tracing component

let
  version = "2.4.0";
  jaeger-component = buildGoModule {
    pname = "jaeger-2-anonymizer";
    inherit version;
    src = fetchFromGitHub {
      owner = "jaegertracing";
      repo = "jaeger";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/2-anonymizer" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = jaeger-component;
  name = "jaeger-2-anonymizer";
  tag = "v${version}";
  entrypoint = [ "${jaeger-component}/bin/2-anonymizer" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger 2 anonymizer";
    "org.opencontainers.image.description" = "Jaeger jaeger-2-anonymizer";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
