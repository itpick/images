{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-trillian-updatetree
# Sigstore signing component

let
  version = "0.7.31";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-trillian-updatetree";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding";
      rev = "v${version}";
      hash = "sha256-HQmttJNpDZ1ra43gJ29pY6Qx/JDj0WACw2TeeCjl9Q8=";
    };
    vendorHash = "sha256-J2I7eEyVfFV5ML59ZMnhqr8EarHl6idS/4X4aVXDZ/M=";
    subPackages = [ "cmd/trillian/updatetree" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = sigstore-component;
  name = "sigstore-scaffolding-trillian-updatetree";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-trillian-updatetree" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding trillian updatetree";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-trillian-updatetree";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
  };
}
