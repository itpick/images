{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - gcp-kms
# https://github.com/crossplane-contrib/provider-gcp-kms

let
  version = "0.1.0";
  provider-gcp-kms = buildGoModule {
    pname = "provider-gcp-kms-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp-kms";
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
      description = "Crossplane provider for gcp-kms";
      homepage = "https://github.com/crossplane-contrib/provider-gcp-kms";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gcp-kms;
  name = "crossplane-provider-gcp-kms-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-gcp-kms}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider gcp kms";
    "org.opencontainers.image.description" = "Crossplane provider for gcp-kms";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
