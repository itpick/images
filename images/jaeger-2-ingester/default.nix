{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-2-ingester
# Jaeger distributed tracing component

let
  version = "2.4.0";
  jaeger-component = buildGoModule {
    pname = "jaeger-2-ingester";
    inherit version;
    src = fetchFromGitHub {
      owner = "jaegertracing";
      repo = "jaeger";
      rev = "v${version}";
      hash = "sha256-DQa/BlMC9RECwLVAZ0kN2O5w1ppJbg5NuDhQ/zXXGuc=";
    };
    vendorHash = null;
    subPackages = [ "cmd/2-ingester" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = jaeger-component;
  name = "jaeger-2-ingester";
  tag = "v${version}";
  entrypoint = [ "${jaeger-component}/bin/2-ingester" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger 2 ingester";
    "org.opencontainers.image.description" = "Jaeger jaeger-2-ingester";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
