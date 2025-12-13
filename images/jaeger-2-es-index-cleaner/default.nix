{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-2-es-index-cleaner
# Jaeger distributed tracing component

let
  version = "2.4.0";
  jaeger-component = buildGoModule {
    pname = "jaeger-2-es-index-cleaner";
    inherit version;
    src = fetchFromGitHub {
      owner = "jaegertracing";
      repo = "jaeger";
      rev = "v${version}";
      hash = "sha256-DQa/BlMC9RECwLVAZ0kN2O5w1ppJbg5NuDhQ/zXXGuc=";
    };
    vendorHash = null;
    subPackages = [ "cmd/2-es-index-cleaner" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = jaeger-component;
  name = "jaeger-2-es-index-cleaner";
  tag = "v${version}";
  entrypoint = [ "${jaeger-component}/bin/2-es-index-cleaner" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger 2 es index cleaner";
    "org.opencontainers.image.description" = "Jaeger jaeger-2-es-index-cleaner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
