{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-nop-fips
# Tekton CI/CD component

let
  version = "0.65.0";
  component = buildGoModule {
    pname = "tekton-nop-fips";
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
  name = "tekton-nop-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/tekton-nop" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton-nop-fips";
    "org.opencontainers.image.description" = "Tekton tekton-nop";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
