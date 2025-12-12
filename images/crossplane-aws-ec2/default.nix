{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-aws-ec2
# Crossplane provider/component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "crossplane-aws-ec2";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/provider" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-aws-ec2";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-aws-ec2";
    "org.opencontainers.image.description" = "Crossplane crossplane-aws-ec2";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
