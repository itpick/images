{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-fips-getoidctoken-fips
# Sigstore signing component

let
  version = "1.0.0";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-fips-getoidctoken";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding-fips-getoidctoken";
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
  name = "sigstore-scaffolding-fips-getoidctoken";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-fips-getoidctoken" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding fips getoidctoken";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-fips-getoidctoken";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
