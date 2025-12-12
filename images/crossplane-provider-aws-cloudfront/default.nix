{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-cloudfront
# https://github.com/crossplane-contrib/provider-aws-cloudfront

let
  version = "0.1.0";
  provider-aws-cloudfront = buildGoModule {
    pname = "provider-aws-cloudfront";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-cloudfront";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-cloudfront";
      homepage = "https://github.com/crossplane-contrib/provider-aws-cloudfront";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-cloudfront;
  name = "crossplane-provider-aws-cloudfront";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-cloudfront}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws cloudfront";
    "org.opencontainers.image.description" = "Crossplane provider for aws-cloudfront";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
