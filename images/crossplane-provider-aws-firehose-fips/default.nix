{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-firehose
# https://github.com/crossplane-contrib/provider-aws-firehose

let
  version = "0.1.0";
  provider-aws-firehose = buildGoModule {
    pname = "provider-aws-firehose-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-firehose";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-firehose";
      homepage = "https://github.com/crossplane-contrib/provider-aws-firehose";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-firehose;
  name = "crossplane-provider-aws-firehose-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-firehose}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws firehose";
    "org.opencontainers.image.description" = "Crossplane provider for aws-firehose";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
