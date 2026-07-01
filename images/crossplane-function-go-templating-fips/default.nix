{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-function-go-templating-fips
# Crossplane provider/component

let
  version = "0.12.2";
  component = buildGoModule {
    pname = "crossplane-function-go-templating-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "function-go-templating";
      rev = "v${version}";
      hash = "sha256-oda2vtHug0dg/ft249CDBGABudE53sd8Izh7JhaYR8w=";
    };
    vendorHash = "sha256-AlNVmh1G9JlFOGy2u9v2INx4dnqKozTyXt46fA3FyYc=";
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-function-go-templating-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-function-go-templating-fips";
    "org.opencontainers.image.description" = "Crossplane crossplane-function-go-templating";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
