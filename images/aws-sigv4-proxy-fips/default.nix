{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-sigv4-proxy-fips
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-sigv4-proxy-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "sigv4-proxy";
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
  name = "aws-sigv4-proxy-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/sigv4-proxy" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws sigv4 proxy";
    "org.opencontainers.image.description" = "AWS aws-sigv4-proxy component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
