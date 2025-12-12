{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-aws-kinesis
# Crossplane provider/component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "crossplane-aws-kinesis";
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
  name = "crossplane-aws-kinesis";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-aws-kinesis";
    "org.opencontainers.image.description" = "Crossplane crossplane-aws-kinesis";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
