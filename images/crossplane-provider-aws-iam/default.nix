{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-iam
# https://github.com/crossplane-contrib/provider-aws-iam

let
  version = "0.1.0";
  provider-aws-iam = buildGoModule {
    pname = "provider-aws-iam";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-iam";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-iam";
      homepage = "https://github.com/crossplane-contrib/provider-aws-iam";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-iam;
  name = "crossplane-provider-aws-iam";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-iam}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws iam";
    "org.opencontainers.image.description" = "Crossplane provider for aws-iam";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
