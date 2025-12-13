{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-application-networking-k8s
# AWS Kubernetes component

let
  version = "1.0.0";
  aws-component = buildGoModule {
    pname = "aws-application-networking-k8s";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-application-networking-k8s";
      rev = "v${version}";
      hash = "sha256-YtDZyjgtgYOAkdND7BUc70F5Z+Gw9fii7+ZMR5SB910=";
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
  name = "aws-application-networking-k8s";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/application-networking-k8s" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws application networking k8s";
    "org.opencontainers.image.description" = "AWS aws-application-networking-k8s component";
    "org.opencontainers.image.version" = version;
  };
}
