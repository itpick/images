{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - terraform
# https://github.com/crossplane-contrib/provider-terraform

let
  version = "0.1.0";
  provider-terraform = buildGoModule {
    pname = "provider-terraform-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-terraform";
      rev = "v${version}";
      hash = "sha256-p7zkijkhnjOTRxBRPG5z5hrApvsGyP/vCYGPua8aQ+A=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for terraform";
      homepage = "https://github.com/crossplane-contrib/provider-terraform";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-terraform;
  name = "crossplane-provider-terraform-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-terraform}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider terraform";
    "org.opencontainers.image.description" = "Crossplane provider for terraform";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
