{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - gcp-storage
# https://github.com/crossplane-contrib/provider-gcp-storage

let
  version = "0.1.0";
  provider-gcp-storage = buildGoModule {
    pname = "provider-gcp-storage-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp-storage";
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
      description = "Crossplane provider for gcp-storage";
      homepage = "https://github.com/crossplane-contrib/provider-gcp-storage";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gcp-storage;
  name = "crossplane-provider-gcp-storage-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-gcp-storage}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider gcp storage";
    "org.opencontainers.image.description" = "Crossplane provider for gcp-storage";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
