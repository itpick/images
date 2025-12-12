{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - family-gcp
# https://github.com/crossplane-contrib/provider-family-gcp

let
  version = "0.1.0";
  provider-family-gcp = buildGoModule {
    pname = "provider-family-gcp-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-family-gcp";
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
      description = "Crossplane provider for family-gcp";
      homepage = "https://github.com/crossplane-contrib/provider-family-gcp";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-family-gcp;
  name = "crossplane-provider-family-gcp-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-family-gcp}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider family gcp";
    "org.opencontainers.image.description" = "Crossplane provider for family-gcp";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
