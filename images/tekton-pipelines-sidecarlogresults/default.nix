{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-pipelines-sidecarlogresults
# Tekton CI/CD component

let
  version = "0.69.0";
  tekton-component = buildGoModule {
    pname = "tekton-pipelines-sidecarlogresults";
    inherit version;
    src = fetchFromGitHub {
      owner = "tektoncd";
      repo = "pipeline";
      rev = "v${version}";
      hash = "sha256-3nNACkp/YPeaSiMStg5aMrCKdWSaMg6XDbft/k3HANc=";
    };
    vendorHash = null;
    subPackages = [ "cmd/pipelines-sidecarlogresults" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = tekton-component;
  name = "tekton-pipelines-sidecarlogresults";
  tag = "v${version}";
  entrypoint = [ "${tekton-component}/bin/pipelines-sidecarlogresults" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton pipelines sidecarlogresults";
    "org.opencontainers.image.description" = "Tekton tekton-pipelines-sidecarlogresults";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
  };
}
