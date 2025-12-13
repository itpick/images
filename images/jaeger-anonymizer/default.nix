{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-anonymizer
# Jaeger distributed tracing

let
  version = "2.0.0";
  component = buildGoModule {
    pname = "jaeger-anonymizer";
    inherit version;
    src = fetchFromGitHub {
      owner = "jaegertracing";
      repo = "jaeger";
      rev = "v${version}";
      hash = "sha256-DQa/BlMC9RECwLVAZ0kN2O5w1ppJbg5NuDhQ/zXXGuc=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "jaeger-anonymizer";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/jaeger-anonymizer" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger-anonymizer";
    "org.opencontainers.image.description" = "Jaeger jaeger-anonymizer";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
