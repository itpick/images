{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-cli-iamguarded-fips
# AWS component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "aws-cli-iamguarded-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-sdk-go";
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
  name = "aws-cli-iamguarded-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/aws-cli-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "aws-cli-iamguarded-fips";
    "org.opencontainers.image.description" = "AWS aws-cli-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
