{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-controller-fips
# Tekton CI/CD component

let
  version = "0.65.0";
  component = buildGoModule {
    pname = "tekton-controller-fips";
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
  name = "tekton-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/tekton-controller" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton-controller-fips";
    "org.opencontainers.image.description" = "Tekton tekton-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
