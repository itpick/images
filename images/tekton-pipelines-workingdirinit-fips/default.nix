{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-pipelines-workingdirinit-fips
# Tekton CI/CD component

let
  version = "0.69.0";
  tekton-component = buildGoModule {
    pname = "tekton-pipelines-workingdirinit-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "tektoncd";
      repo = "pipeline";
      rev = "v${version}";
      hash = "sha256-3nNACkp/YPeaSiMStg5aMrCKdWSaMg6XDbft/k3HANc=";
    };
    vendorHash = null;
    subPackages = [ "cmd/pipelines-workingdirinit" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = tekton-component;
  name = "tekton-pipelines-workingdirinit-fips";
  tag = "v${version}";
  entrypoint = [ "${tekton-component}/bin/pipelines-workingdirinit" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton pipelines workingdirinit";
    "org.opencontainers.image.description" = "Tekton tekton-pipelines-workingdirinit";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
