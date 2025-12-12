{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-eks
# https://github.com/crossplane-contrib/provider-aws-eks

let
  version = "0.1.0";
  provider-aws-eks = buildGoModule {
    pname = "provider-aws-eks";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-eks";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-eks";
      homepage = "https://github.com/crossplane-contrib/provider-aws-eks";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-eks;
  name = "crossplane-provider-aws-eks";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-eks}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws eks";
    "org.opencontainers.image.description" = "Crossplane provider for aws-eks";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
