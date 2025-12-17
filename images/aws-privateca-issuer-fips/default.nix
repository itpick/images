{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-privateca-issuer-fips
# AWS Kubernetes component

let
  version = "1.8.0";
  aws-component = buildGoModule {
    pname = "aws-privateca-issuer-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "cert-manager";
      repo = "aws-privateca-issuer";
      rev = "v${version}";
      hash = "sha256-sN8Jvm0ZduxVAua+ru1G3Ws6f0gG6+4MST/bMaJ5ltY=";
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
  name = "aws-privateca-issuer-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/privateca-issuer" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws privateca issuer";
    "org.opencontainers.image.description" = "AWS aws-privateca-issuer component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
