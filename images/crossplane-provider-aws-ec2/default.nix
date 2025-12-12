{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-ec2
# https://github.com/crossplane-contrib/provider-aws-ec2

let
  version = "0.1.0";
  provider-aws-ec2 = buildGoModule {
    pname = "provider-aws-ec2";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-ec2";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-ec2";
      homepage = "https://github.com/crossplane-contrib/provider-aws-ec2";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-ec2;
  name = "crossplane-provider-aws-ec2";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-ec2}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws ec2";
    "org.opencontainers.image.description" = "Crossplane provider for aws-ec2";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
