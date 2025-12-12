{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-application-networking-k8s-fips
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-application-networking-k8s-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "application-networking-k8s";
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
  name = "aws-application-networking-k8s-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/application-networking-k8s" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws application networking k8s";
    "org.opencontainers.image.description" = "AWS aws-application-networking-k8s component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
