{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-trillian-createtree
# Sigstore signing component

let
  version = "0.7.31";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-trillian-createtree";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding";
      rev = "v${version}";
      hash = "sha256-HQmttJNpDZ1ra43gJ29pY6Qx/JDj0WACw2TeeCjl9Q8=";
    };
    vendorHash = "sha256-J2I7eEyVfFV5ML59ZMnhqr8EarHl6idS/4X4aVXDZ/M=";
    subPackages = [ "cmd/trillian/createtree" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = sigstore-component;
  name = "sigstore-scaffolding-trillian-createtree";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-trillian-createtree" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding trillian createtree";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-trillian-createtree";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
  };
}
