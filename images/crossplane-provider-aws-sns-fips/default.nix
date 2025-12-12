{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - aws-sns
# https://github.com/crossplane-contrib/provider-aws-sns

let
  version = "0.1.0";
  provider-aws-sns = buildGoModule {
    pname = "provider-aws-sns-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws-sns";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for aws-sns";
      homepage = "https://github.com/crossplane-contrib/provider-aws-sns";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws-sns;
  name = "crossplane-provider-aws-sns-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-aws-sns}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider aws sns";
    "org.opencontainers.image.description" = "Crossplane provider for aws-sns";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
