{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - gcp-compute
# https://github.com/crossplane-contrib/provider-gcp-compute

let
  version = "0.1.0";
  provider-gcp-compute = buildGoModule {
    pname = "provider-gcp-compute-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp-compute";
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
      description = "Crossplane provider for gcp-compute";
      homepage = "https://github.com/crossplane-contrib/provider-gcp-compute";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gcp-compute;
  name = "crossplane-provider-gcp-compute-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-gcp-compute}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider gcp compute";
    "org.opencontainers.image.description" = "Crossplane provider for gcp-compute";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
