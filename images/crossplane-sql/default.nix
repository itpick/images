{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-sql
# Crossplane provider/component

let
  version = "0.15.0";
  component = buildGoModule {
    pname = "crossplane-sql";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-sql";
      rev = "v${version}";
      hash = "sha256-3u/5qzQsDCUsGG2BVavZABCJcc8pPpEuqHLZnWxekss=";
    };
    vendorHash = "sha256-L2nFm3RqlZBz1INcR7bJ+Q4cct5SM+mtSBsL7sovtdI=";
    subPackages = [ "cmd/provider" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-sql";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-sql";
    "org.opencontainers.image.description" = "Crossplane crossplane-sql";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
