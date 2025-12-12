{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-flb-cloudwatch-fips
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-flb-cloudwatch-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "flb-cloudwatch";
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
  name = "aws-flb-cloudwatch-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/flb-cloudwatch" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws flu cloudwatch";
    "org.opencontainers.image.description" = "AWS aws-flb-cloudwatch component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
