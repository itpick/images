{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-nop
# Tekton CI/CD component

let
  version = "0.65.0";
  component = buildGoModule {
    pname = "tekton-nop";
    inherit version;
    src = fetchFromGitHub {
      owner = "tektoncd";
      repo = "pipeline";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "tekton-nop";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/tekton-nop" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton-nop";
    "org.opencontainers.image.description" = "Tekton tekton-nop";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
  };
}
