{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-fips-ctlog-verifyfulcio-fips
# Sigstore signing component

let
  version = "1.0.0";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-fips-ctlog-verifyfulcio";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "cosign";
      rev = "v${version}";
      hash = "sha256-+0R/srRJaOY4dOn4sDcIbaquoyxW/JbvRXkpCFDZNWk=";
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
  name = "sigstore-scaffolding-fips-ctlog-verifyfulcio";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-fips-ctlog-verifyfulcio" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding fips ctlog verifyfulcio";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-fips-ctlog-verifyfulcio";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
