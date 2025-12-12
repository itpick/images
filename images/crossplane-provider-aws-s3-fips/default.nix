{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-s3
# https://github.com/crossplane-contrib/provider-aws-s3

let
  version = "0.1.0";
  provider-aws-s3 = buildGoModule {
    pname = "provider-aws-s3-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-s3";
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
      description = "Crossplane provider for aws-s3";
      homepage = "https://github.com/crossplane-contrib/provider-aws-s3";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-s3;
  name = "crossplane-provider-aws-s3-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-s3}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws s3";
    "org.opencontainers.image.description" = "Crossplane provider for aws-s3";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
