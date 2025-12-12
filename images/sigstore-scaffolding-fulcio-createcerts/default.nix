{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-fulcio-createcerts
# Sigstore signing component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "sigstore-scaffolding-fulcio-createcerts";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "cosign";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "sigstore-scaffolding-fulcio-createcerts";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/sigstore-scaffolding-fulcio-createcerts" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore-scaffolding-fulcio-createcerts";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-fulcio-createcerts";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
  };
}
