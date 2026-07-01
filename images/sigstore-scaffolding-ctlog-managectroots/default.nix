{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-ctlog-managectroots
# Sigstore signing component

let
  version = "0.7.31";
  component = buildGoModule {
    pname = "sigstore-scaffolding-ctlog-managectroots";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding";
      rev = "v${version}";
      hash = "sha256-HQmttJNpDZ1ra43gJ29pY6Qx/JDj0WACw2TeeCjl9Q8=";
    };
    vendorHash = "sha256-J2I7eEyVfFV5ML59ZMnhqr8EarHl6idS/4X4aVXDZ/M=";
    subPackages = [ "cmd/ctlog/managectroots" ];
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
