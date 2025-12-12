{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-sqs
# https://github.com/crossplane-contrib/provider-aws-sqs

let
  version = "0.1.0";
  provider-aws-sqs = buildGoModule {
    pname = "provider-aws-sqs";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-sqs";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-sqs";
      homepage = "https://github.com/crossplane-contrib/provider-aws-sqs";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-sqs;
  name = "crossplane-provider-aws-sqs";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-sqs}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws sqs";
    "org.opencontainers.image.description" = "Crossplane provider for aws-sqs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
