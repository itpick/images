{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-node-termination-handler-fips
# AWS component

let
  version = "1.25.3";
  component = buildGoModule {
    pname = "aws-node-termination-handler-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-node-termination-handler";
      rev = "v${version}";
      hash = "sha256-oOkWynLQFUwdb6/fPC4d1zPQSwPuu4DN+YoqU6kD9PQ=";
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
  name = "aws-node-termination-handler-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/aws-node-termination-handler" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "aws-node-termination-handler-fips";
    "org.opencontainers.image.description" = "AWS aws-node-termination-handler";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
