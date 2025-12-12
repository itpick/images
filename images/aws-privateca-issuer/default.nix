{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-privateca-issuer
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-privateca-issuer";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "privateca-issuer";
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
  name = "aws-privateca-issuer";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/privateca-issuer" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws privateca issuer";
    "org.opencontainers.image.description" = "AWS aws-privateca-issuer component";
    "org.opencontainers.image.version" = version;
  };
}
