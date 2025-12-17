{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# aws-network-policy-agent-fips
# AWS Kubernetes component

let
  version = "1.3.0";
  aws-component = buildGoModule {
    pname = "aws-network-policy-agent-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "aws";
      repo = "aws-network-policy-agent";
      rev = "v${version}";
      hash = "sha256-CuWoeNOmAvfpGbk4ZgxFw/kfvLBIg4zi+dar/bMuySA=";
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
