{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-remote-storage
# Jaeger distributed tracing

let
  version = "2.0.0";
  component = buildGoModule {
    pname = "jaeger-remote-storage";
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
  name = "jaeger-remote-storage";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/jaeger-remote-storage" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger-remote-storage";
    "org.opencontainers.image.description" = "Jaeger jaeger-remote-storage";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
