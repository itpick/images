{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-otel-collector-healthcheck
# AWS Kubernetes component

let
  version = "0.46.0";
  aws-component = buildGoModule {
    pname = "aws-otel-collector-healthcheck";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws-observability";
      repo = "aws-otel-collector";
      rev = "v${version}";
      hash = "sha256-aUXyCMzZFys1niPtGhysUe34g/pQBAcyfRD6X57D6CA=";
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
  name = "aws-otel-collector-healthcheck";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/otel-collector-healthcheck" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws otel collector healthcheck";
    "org.opencontainers.image.description" = "AWS aws-otel-collector-healthcheck component";
    "org.opencontainers.image.version" = version;
  };
}
