{ mkImage, pkgs, lib, ... }:

# monstache - sync daemon from MongoDB to Elasticsearch
# https://github.com/rwynn/monstache
#
# v6.8.0 prebuilt is Go-stdlib stale (2 crit CVEs). Rebuild from source
# at same tag with nixpkgs' Go.

let
  version = "6.8.0";

  drv = pkgs.buildGoModule {
    pname = "monstache";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "rwynn";
      repo = "monstache";
      rev = "v${version}";
      hash = "sha256-unjrm9cnuxSBXeuACLghosN9zfnTX8dtyT5kl1b1sUg=";
    };

    vendorHash = "sha256-sJvTOEjqKTVfcwWER30B9T5IwZAGAybRRIYQTF/UDsk=";

    ldflags = [ "-s" "-w" ];
    env.CGO_ENABLED = 0;
    doCheck = false;
  };

in mkImage {
  inherit drv;
  name = "monstache";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/monstache" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "monstache";
    "org.opencontainers.image.description" = "Sync daemon from MongoDB to Elasticsearch";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "source-build";
  };
}
