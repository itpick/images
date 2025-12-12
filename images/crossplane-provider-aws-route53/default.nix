{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-route53
# https://github.com/crossplane-contrib/provider-aws-route53

let
  version = "0.1.0";
  provider-aws-route53 = buildGoModule {
    pname = "provider-aws-route53";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-route53";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-route53";
      homepage = "https://github.com/crossplane-contrib/provider-aws-route53";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-route53;
  name = "crossplane-provider-aws-route53";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-route53}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws route53";
    "org.opencontainers.image.description" = "Crossplane provider for aws-route53";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
