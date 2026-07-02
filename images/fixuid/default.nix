{ mkImage, pkgs, lib, ... }:

# fixuid - reconcile container user/group ownership at runtime
# https://github.com/boxboat/fixuid
#
# v0.6.0 upstream prebuilt tarball is Go-stdlib stale (4 crit CVEs).
# Rebuild from source at same tag with nixpkgs' Go.

let
  version = "0.6.0";

  drv = pkgs.buildGoModule {
    pname = "fixuid";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "boxboat";
      repo = "fixuid";
      rev = "v${version}";
      hash = "sha256-XYu72Sexm+sbMG+jE68CETu8BI0zul9gqEZ7OQJK6Qo=";
    };

    vendorHash = "sha256-t6Ym/JFEThxaHxedmcCtVoGoumbO9oqg7zs1XS+eiRE=";

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;
  };

in mkImage {
  inherit drv;
  name = "fixuid";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/fixuid" ];
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "fixuid";
    "org.opencontainers.image.description" = "Reconcile container user/group ownership at runtime";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
