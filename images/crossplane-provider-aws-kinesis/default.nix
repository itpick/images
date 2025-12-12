{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-kinesis
# https://github.com/crossplane-contrib/provider-aws-kinesis

let
  version = "0.1.0";
  provider-aws-kinesis = buildGoModule {
    pname = "provider-aws-kinesis";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-kinesis";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-kinesis";
      homepage = "https://github.com/crossplane-contrib/provider-aws-kinesis";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-kinesis;
  name = "crossplane-provider-aws-kinesis";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-kinesis}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws kinesis";
    "org.opencontainers.image.description" = "Crossplane provider for aws-kinesis";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
