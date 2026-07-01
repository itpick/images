{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-sql-fips
# Crossplane provider/component

let
  version = "0.15.0";
  component = buildGoModule {
    pname = "crossplane-sql-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-sql";
      rev = "v${version}";
      hash = "sha256-3u/5qzQsDCUsGG2BVavZABCJcc8pPpEuqHLZnWxekss=";
    };
    vendorHash = "sha256-L2nFm3RqlZBz1INcR7bJ+Q4cct5SM+mtSBsL7sovtdI=";
    subPackages = [ "cmd/provider" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-sql-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-sql-fips";
    "org.opencontainers.image.description" = "Crossplane crossplane-sql";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
