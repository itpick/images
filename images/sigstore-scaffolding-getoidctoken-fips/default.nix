{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-getoidctoken-fips
# Sigstore signing component

let
  version = "0.7.31";
  component = buildGoModule {
    pname = "sigstore-scaffolding-getoidctoken-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding";
      rev = "v${version}";
      hash = "sha256-HQmttJNpDZ1ra43gJ29pY6Qx/JDj0WACw2TeeCjl9Q8=";
    };
    vendorHash = "sha256-J2I7eEyVfFV5ML59ZMnhqr8EarHl6idS/4X4aVXDZ/M=";
    subPackages = [ "cmd/getoidctoken" ];
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
