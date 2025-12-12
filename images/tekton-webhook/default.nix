{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# tekton-webhook
# Tekton CI/CD component

let
  version = "0.65.0";
  component = buildGoModule {
    pname = "tekton-webhook";
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
  name = "tekton-webhook";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/tekton-webhook" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "tekton-webhook";
    "org.opencontainers.image.description" = "Tekton tekton-webhook";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "tekton";
  };
}
