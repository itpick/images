{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - family-aws
# https://github.com/crossplane-contrib/provider-family-aws

let
  version = "0.1.0";
  provider-family-aws = buildGoModule {
    pname = "provider-family-aws";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-family-aws";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for family-aws";
      homepage = "https://github.com/crossplane-contrib/provider-family-aws";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-family-aws;
  name = "crossplane-provider-family-aws";
  tag = "v${version}";
  entrypoint = [ "${provider-family-aws}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider family aws";
    "org.opencontainers.image.description" = "Crossplane provider for family-aws";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
