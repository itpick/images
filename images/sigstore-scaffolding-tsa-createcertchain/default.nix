{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-tsa-createcertchain
# Sigstore signing component

let
  version = "1.0.0";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-tsa-createcertchain";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "cosign";
      rev = "v${version}";
      hash = "sha256-+0R/srRJaOY4dOn4sDcIbaquoyxW/JbvRXkpCFDZNWk=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = sigstore-component;
  name = "sigstore-scaffolding-tsa-createcertchain";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-tsa-createcertchain" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding tsa createcertchain";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-tsa-createcertchain";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
  };
}
