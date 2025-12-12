{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-pipelines-resolvers-fips
# Tekton CI/CD component

let
  version = "0.69.0";
  tekton-component = buildGoModule {
    pname = "tekton-pipelines-resolvers-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "tektoncd";
      repo = "pipeline";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "cmd/pipelines-resolvers" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = tekton-component;
  name = "tekton-pipelines-resolvers-fips";
  tag = "v${version}";
  entrypoint = [ "${tekton-component}/bin/pipelines-resolvers" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton pipelines resolvers";
    "org.opencontainers.image.description" = "Tekton tekton-pipelines-resolvers";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
