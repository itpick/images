{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-pipelines-nop
# Tekton CI/CD component

let
  version = "0.69.0";
  tekton-component = buildGoModule {
    pname = "tekton-pipelines-nop";
    inherit version;
    src = fetchFromGitHub {
      owner = "tektoncd";
      repo = "pipeline";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/pipelines-nop" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = tekton-component;
  name = "tekton-pipelines-nop";
  tag = "v${version}";
  entrypoint = [ "${tekton-component}/bin/pipelines-nop" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton pipelines nop";
    "org.opencontainers.image.description" = "Tekton tekton-pipelines-nop";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
  };
}
