{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-fips-rekor-createsecret-fips
# Sigstore signing component

let
  version = "1.0.0";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-fips-rekor-createsecret";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding-fips-rekor-createsecret";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = sigstore-component;
  name = "sigstore-scaffolding-fips-rekor-createsecret";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-fips-rekor-createsecret" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding fips rekor createsecret";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-fips-rekor-createsecret";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
