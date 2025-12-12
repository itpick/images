{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-for-fluent-bit
# AWS component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "aws-for-fluent-bit";
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
  name = "aws-for-fluent-bit";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/aws-for-fluent-bit" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "aws-for-fluent-bit";
    "org.opencontainers.image.description" = "AWS aws-for-fluent-bit";
    "org.opencontainers.image.version" = version;
  };
}
