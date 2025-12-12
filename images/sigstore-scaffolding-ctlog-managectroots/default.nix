{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-ctlog-managectroots
# Sigstore signing component

let
  version = "1.0.0";
  component = buildGoModule {
    pname = "sigstore-scaffolding-ctlog-managectroots";
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
  name = "sigstore-scaffolding-ctlog-managectroots";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/sigstore-scaffolding-ctlog-managectroots" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore-scaffolding-ctlog-managectroots";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-ctlog-managectroots";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
  };
}
