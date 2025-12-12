{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-kms
# https://github.com/crossplane-contrib/provider-aws-kms

let
  version = "0.1.0";
  provider-aws-kms = buildGoModule {
    pname = "provider-aws-kms";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-kms";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-kms";
      homepage = "https://github.com/crossplane-contrib/provider-aws-kms";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-kms;
  name = "crossplane-provider-aws-kms";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-kms}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws kms";
    "org.opencontainers.image.description" = "Crossplane provider for aws-kms";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
