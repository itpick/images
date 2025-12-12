{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-rekor-createsecret
# Sigstore signing component

let
  version = "1.0.0";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-rekor-createsecret";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding-rekor-createsecret";
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
  drv = sigstore-component;
  name = "sigstore-scaffolding-rekor-createsecret";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-rekor-createsecret" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding rekor createsecret";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-rekor-createsecret";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
  };
}
