{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-rds
# https://github.com/crossplane-contrib/provider-aws-rds

let
  version = "0.1.0";
  provider-aws-rds = buildGoModule {
    pname = "provider-aws-rds";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-rds";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-rds";
      homepage = "https://github.com/crossplane-contrib/provider-aws-rds";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-rds;
  name = "crossplane-provider-aws-rds";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-rds}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws rds";
    "org.opencontainers.image.description" = "Crossplane provider for aws-rds";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
