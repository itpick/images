{ mkImage, pkgs, lib, ... }:

# paranoia - inspect the certificate authorities in container images
# https://github.com/jetstack/paranoia
#
# v0.5.0 prebuilt is Go-stdlib stale (2 crit CVEs). Rebuild from source
# at same tag with nixpkgs' Go.

let
  version = "0.5.0";

  drv = pkgs.buildGoModule {
    pname = "paranoia";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "jetstack";
      repo = "paranoia";
      rev = "v${version}";
      hash = "sha256-o1a7xI2TeSVIUoebS4AdcxhWOYMudL9CsbgcvCbiKL0=";
    };

    vendorHash = "sha256-MP4YcvFZ8CnUWyjB/VqUvVkk4cqLpY5JpciRuU8ivvU=";

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;
  };
in mkImage {
  inherit drv;
  name = "paranoia";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/paranoia" ];
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "paranoia";
    "org.opencontainers.image.description" = "Inspect the certificate authorities in container images";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
