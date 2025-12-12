{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-s3-controller
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-s3-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "s3-controller";
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
  name = "aws-s3-controller";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/s3-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws s3 controller";
    "org.opencontainers.image.description" = "AWS aws-s3-controller component";
    "org.opencontainers.image.version" = version;
  };
}
