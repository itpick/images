{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-sidecarlogresults-fips
# Tekton CI/CD component

let
  version = "0.65.0";
  component = buildGoModule {
    pname = "tekton-sidecarlogresults-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "tektoncd";
      repo = "pipeline";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "tekton-sidecarlogresults-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/tekton-sidecarlogresults" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton-sidecarlogresults-fips";
    "org.opencontainers.image.description" = "Tekton tekton-sidecarlogresults";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
