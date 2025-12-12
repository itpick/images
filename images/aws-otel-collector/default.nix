{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-otel-collector
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-otel-collector";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "otel-collector";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = aws-component;
  name = "aws-otel-collector";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/otel-collector" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws otel collector";
    "org.opencontainers.image.description" = "AWS aws-otel-collector component";
    "org.opencontainers.image.version" = version;
  };
}
