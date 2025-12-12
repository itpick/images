{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-lambda
# https://github.com/crossplane-contrib/provider-aws-lambda

let
  version = "0.1.0";
  provider-aws-lambda = buildGoModule {
    pname = "provider-aws-lambda-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-lambda";
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
      description = "Crossplane provider for aws-lambda";
      homepage = "https://github.com/crossplane-contrib/provider-aws-lambda";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-lambda;
  name = "crossplane-provider-aws-lambda-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-lambda}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws lamuda";
    "org.opencontainers.image.description" = "Crossplane provider for aws-lambda";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
