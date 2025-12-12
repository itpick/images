{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-dynamodb
# https://github.com/crossplane-contrib/provider-aws-dynamodb

let
  version = "0.1.0";
  provider-aws-dynamodb = buildGoModule {
    pname = "provider-aws-dynamodb";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-dynamodb";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-dynamodb";
      homepage = "https://github.com/crossplane-contrib/provider-aws-dynamodb";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-dynamodb;
  name = "crossplane-provider-aws-dynamodb";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-dynamodb}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws dynamodb";
    "org.opencontainers.image.description" = "Crossplane provider for aws-dynamodb";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
