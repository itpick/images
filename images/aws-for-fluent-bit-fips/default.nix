{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-for-fluent-bit-fips
# AWS Kubernetes component

let
  version = "3.4.4";
  aws-component = buildGoModule {
    pname = "aws-for-fluent-bit-fips";
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
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = aws-component;
  name = "aws-for-fluent-bit-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/for-fluent-bit" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws for fluent uit";
    "org.opencontainers.image.description" = "AWS aws-for-fluent-bit component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
