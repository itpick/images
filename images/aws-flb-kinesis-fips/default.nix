{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-flb-kinesis-fips
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-flb-kinesis-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "flb-kinesis";
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

in
mkImage {
  drv = aws-component;
  name = "aws-flb-kinesis-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/flb-kinesis" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws flu kinesis";
    "org.opencontainers.image.description" = "AWS aws-flb-kinesis component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
