{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-otel-collector-healthcheck-fips
# AWS Kubernetes component

let
  version = "0.48.0";
  aws-component = buildGoModule {
    pname = "aws-otel-collector-healthcheck-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws-observability";
      repo = "aws-otel-collector";
      rev = "v${version}";
      hash = "sha256-ceSC/G6wWFAN814ZNriBskcn7xXccVPMxK2iOU/yjuw=";
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
  name = "aws-otel-collector-healthcheck-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/otel-collector-healthcheck" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws otel collector healthcheck";
    "org.opencontainers.image.description" = "AWS aws-otel-collector-healthcheck component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
