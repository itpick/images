{ mkImage, pkgs, lib, ... }:

# KSOPS - kustomize SOPS plugin
# https://github.com/viaduct-ai/kustomize-sops
#
# v4.5.1 prebuilt is Go-stdlib stale (2 crit CVEs). Rebuild from source
# at same tag with nixpkgs' Go.

let
  version = "4.5.1";

  drv = pkgs.buildGoModule {
    pname = "ksops";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "viaduct-ai";
      repo = "kustomize-sops";
      rev = "v${version}";
      hash = "sha256-OYn31OBnpZF1jCO7OgGCZig/7G+V6PlljINsA67z2XM=";
    };

    vendorHash = "sha256-4NyrK3iaAqIaoikfProfsghYA5kX6dSGChnchhZZZ9A=";

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;
  };
in mkImage {
  inherit drv;
  name = "ksops";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/ksops" ];
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "ksops";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
