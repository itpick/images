{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-fips-fulcio-createcerts-fips
# Sigstore signing component

let
  version = "0.7.31";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-fips-fulcio-createcerts";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding";
      rev = "v${version}";
      hash = "sha256-HQmttJNpDZ1ra43gJ29pY6Qx/JDj0WACw2TeeCjl9Q8=";
    };
    vendorHash = "sha256-J2I7eEyVfFV5ML59ZMnhqr8EarHl6idS/4X4aVXDZ/M=";
    subPackages = [ "cmd/fulcio/createcerts" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = sigstore-component;
  name = "sigstore-scaffolding-fips-fulcio-createcerts";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-fips-fulcio-createcerts" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding fips fulcio createcerts";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-fips-fulcio-createcerts";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
