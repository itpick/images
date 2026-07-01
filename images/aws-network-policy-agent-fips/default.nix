{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-network-policy-agent-fips
# AWS Kubernetes component

let
  version = "1.3.5";
  aws-component = buildGoModule {
    pname = "aws-network-policy-agent-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-network-policy-agent";
      rev = "v${version}";
      hash = "sha256-NePswunA72apmkdBCOmFjV94FPXvfnbi4L7Y5Oz/GKg=";
    };

    proxyVendor = true;
    vendorHash = "sha256-A3Mlvh7/J/+SGwUpNpIrkjtM5tAvb6LwVWSjWxOc014=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = aws-component;
  name = "aws-network-policy-agent-fips";
  tag = "v${version}";
  entrypoint = [ "${aws-component}/bin/network-policy-agent" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "aws network policy agent";
    "org.opencontainers.image.description" = "AWS aws-network-policy-agent component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
