# neuvector-registry-adapter
# =============
# NeuVector Registry Adapter - Registry scanning adapter
# https://github.com/neuvector/registry-adapter
#
# Adapter for integrating NeuVector scanning with container registries.

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

let
  version = "5.4.7";
  neuvector-registry-adapter = buildGoModule {
    pname = "neuvector-registry-adapter";
    inherit version;

    src = fetchFromGitHub {
      owner = "neuvector";
      repo = "registry-adapter";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "NeuVector Registry Adapter";
      homepage = "https://github.com/neuvector/registry-adapter";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = neuvector-registry-adapter;
  name = "neuvector-registry-adapter";
  tag = "v${version}";
  entrypoint = [ "${neuvector-registry-adapter}/bin/registry-adapter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "NeuVector Registry Adapter";
    "org.opencontainers.image.description" = "Registry scanning adapter for NeuVector";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "neuvector";
  };
}
