{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-for-fluent-bit
# AWS component

let
  version = "3.4.4";
  component = buildGoModule {
    pname = "aws-for-fluent-bit";
    inherit version;
    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-for-fluent-bit";
      rev = "v${version}";
      hash = "sha256-qroUNTzP2V/4epBbn7w2jXqIk2/1G7mGT/+K231WCQ8=";
    };
    proxyVendor = true;
    vendorHash = "sha256-ZA9GHiEhHFfRechrZUvx2QnsvPjRtRGK0wRUyhtWfTc=";
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
