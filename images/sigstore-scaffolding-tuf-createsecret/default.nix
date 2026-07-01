{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# sigstore-scaffolding-tuf-createsecret
# Sigstore signing component

let
  version = "0.7.31";
  sigstore-component = buildGoModule {
    pname = "sigstore-scaffolding-tuf-createsecret";
    inherit version;
    src = fetchFromGitHub {
      owner = "sigstore";
      repo = "scaffolding";
      rev = "v${version}";
      hash = "sha256-HQmttJNpDZ1ra43gJ29pY6Qx/JDj0WACw2TeeCjl9Q8=";
    };
    vendorHash = "sha256-J2I7eEyVfFV5ML59ZMnhqr8EarHl6idS/4X4aVXDZ/M=";
    subPackages = [ "cmd/tuf/createsecret" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = sigstore-component;
  name = "sigstore-scaffolding-tuf-createsecret";
  tag = "v${version}";
  entrypoint = [ "${sigstore-component}/bin/scaffolding-tuf-createsecret" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "sigstore scaffolding tuf createsecret";
    "org.opencontainers.image.description" = "Sigstore sigstore-scaffolding-tuf-createsecret";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "sigstore";
  };
}
