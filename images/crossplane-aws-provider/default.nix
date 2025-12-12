{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane - aws-provider
# https://github.com/crossplane/crossplane

let
  version = "2.1.3";
  crossplane-aws-provider = buildGoModule {
    pname = "crossplane-aws-provider";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane";
      repo = "crossplane";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/crossplane" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane aws-provider component";
      homepage = "https://crossplane.io";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = crossplane-aws-provider;
  name = "crossplane-aws-provider";
  tag = "v${version}";
  entrypoint = [ "${crossplane-aws-provider}/bin/crossplane" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane aws provider";
    "org.opencontainers.image.description" = "Crossplane aws-provider component";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
