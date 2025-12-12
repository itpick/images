{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# dapr-operator-fips
# Dapr component

let
  version = "1.14.0";
  component = buildGoModule {
    pname = "dapr-operator-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "dapr";
      repo = "dapr";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "dapr-operator-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/dapr-operator" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "dapr-operator-fips";
    "org.opencontainers.image.description" = "Dapr dapr-operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "dapr";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
