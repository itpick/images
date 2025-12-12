{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-ctlog-verifyfulcio-fips
# Sigstore signing component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "sigstore-scaffolding-ctlog-verifyfulcio-fips";
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
  name = "sigstore-scaffolding-ctlog-verifyfulcio-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/sigstore-scaffolding-ctlog-verifyfulcio" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore-scaffolding-ctlog-verifyfulcio-fips";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-ctlog-verifyfulcio";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
