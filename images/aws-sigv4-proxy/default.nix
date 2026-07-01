{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-sigv4-proxy
# AWS Kubernetes component

let
  version = "1.11.1";
  aws-component = buildGoModule {
    pname = "aws-sigv4-proxy";
    inherit version;

    src = fetchFromGitHub {
      owner = "awslabs";
      repo = "aws-sigv4-proxy";
      rev = "v${version}";
      hash = "sha256-ni5uE9Sa2PblePxg+mZBQ0jD8YHugfIXhtNRuLrQCzY=";
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
  name = "aws-sigv4-proxy";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/sigv4-proxy" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws sigv4 proxy";
    "org.opencontainers.image.description" = "AWS aws-sigv4-proxy component";
    "org.opencontainers.image.version" = version;
  };
}
