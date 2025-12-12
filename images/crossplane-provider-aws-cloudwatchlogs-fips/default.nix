{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-cloudwatchlogs
# https://github.com/crossplane-contrib/provider-aws-cloudwatchlogs

let
  version = "0.1.0";
  provider-aws-cloudwatchlogs = buildGoModule {
    pname = "provider-aws-cloudwatchlogs-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-cloudwatchlogs";
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
      description = "Crossplane provider for aws-cloudwatchlogs";
      homepage = "https://github.com/crossplane-contrib/provider-aws-cloudwatchlogs";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-cloudwatchlogs;
  name = "crossplane-provider-aws-cloudwatchlogs-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-cloudwatchlogs}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws cloudwatchlogs";
    "org.opencontainers.image.description" = "Crossplane provider for aws-cloudwatchlogs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
