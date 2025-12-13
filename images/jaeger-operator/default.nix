{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# jaeger-operator
# Jaeger distributed tracing component

let
  version = "2.4.0";
  jaeger-component = buildGoModule {
    pname = "jaeger-operator";
    inherit version;
    src = fetchFromGitHub {
      owner = "jaegertracing";
      repo = "jaeger";
      rev = "v${version}";
      hash = "sha256-DQa/BlMC9RECwLVAZ0kN2O5w1ppJbg5NuDhQ/zXXGuc=";
    };
    vendorHash = null;
    subPackages = [ "cmd/operator" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = jaeger-component;
  name = "jaeger-operator";
  tag = "v${version}";
  entrypoint = [ "${jaeger-component}/bin/operator" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "jaeger operator";
    "org.opencontainers.image.description" = "Jaeger jaeger-operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jaeger";
  };
}
