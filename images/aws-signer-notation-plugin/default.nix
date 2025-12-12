{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-signer-notation-plugin
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-signer-notation-plugin";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "signer-notation-plugin";
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
  name = "aws-signer-notation-plugin";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/signer-notation-plugin" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws signer notation plugin";
    "org.opencontainers.image.description" = "AWS aws-signer-notation-plugin component";
    "org.opencontainers.image.version" = version;
  };
}
