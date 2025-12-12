{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-getoidctoken
# Sigstore signing component

let
  version = "1.0.0";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-getoidctoken";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding-getoidctoken";
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
  name = "sigstore-scaffolding-getoidctoken";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-getoidctoken" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding getoidctoken";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-getoidctoken";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
  };
}
