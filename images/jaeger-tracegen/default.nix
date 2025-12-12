{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-tracegen
# Jaeger distributed tracing

let
  version = "2.0.0";
  component = buildGoModule {
    pname = "jaeger-tracegen";
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
  name = "jaeger-tracegen";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/jaeger-tracegen" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger-tracegen";
    "org.opencontainers.image.description" = "Jaeger jaeger-tracegen";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
