{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-eks-pod-identity-agent
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-eks-pod-identity-agent";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "eks-pod-identity-agent";
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
  name = "aws-eks-pod-identity-agent";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/eks-pod-identity-agent" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws eks pod identity agent";
    "org.opencontainers.image.description" = "AWS aws-eks-pod-identity-agent component";
    "org.opencontainers.image.version" = version;
  };
}
