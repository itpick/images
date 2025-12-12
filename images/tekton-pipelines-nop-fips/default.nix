{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-pipelines-nop-fips
# Tekton CI/CD component

let
  version = "0.69.0";
  tekton-component = buildGoModule {
    pname = "tekton-pipelines-nop-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "tektoncd";
      repo = "pipeline";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/pipelines-nop" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = tekton-component;
  name = "tekton-pipelines-nop-fips";
  tag = "v${version}";
  entrypoint = [ "${tekton-component}/bin/pipelines-nop" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton pipelines nop";
    "org.opencontainers.image.description" = "Tekton tekton-pipelines-nop";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
