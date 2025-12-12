{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-gateway-controller
# AWS component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "aws-gateway-controller";
    inherit version;
    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-sdk-go";
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
  name = "aws-gateway-controller";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/aws-gateway-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "aws-gateway-controller";
    "org.opencontainers.image.description" = "AWS aws-gateway-controller";
    "org.opencontainers.image.version" = version;
  };
}
