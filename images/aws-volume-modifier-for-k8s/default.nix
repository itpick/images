{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-volume-modifier-for-k8s
# AWS component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "aws-volume-modifier-for-k8s";
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
  name = "aws-volume-modifier-for-k8s";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/aws-volume-modifier-for-k8s" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "aws-volume-modifier-for-k8s";
    "org.opencontainers.image.description" = "AWS aws-volume-modifier-for-k8s";
    "org.opencontainers.image.version" = version;
  };
}
