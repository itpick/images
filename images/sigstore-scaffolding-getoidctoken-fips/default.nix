{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-getoidctoken-fips
# Sigstore signing component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "sigstore-scaffolding-getoidctoken-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "cosign";
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
  drv = component;
  name = "sigstore-scaffolding-getoidctoken-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/sigstore-scaffolding-getoidctoken" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore-scaffolding-getoidctoken-fips";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-getoidctoken";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
