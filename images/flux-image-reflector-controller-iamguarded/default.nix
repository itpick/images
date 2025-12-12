{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-image-reflector-controller-iamguarded
# Flux GitOps component

let
  version = "2.4.0";
  component = buildGoModule {
    pname = "flux-image-reflector-controller-iamguarded";
    inherit version;
    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "flux2";
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
  name = "flux-image-reflector-controller-iamguarded";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/flux-image-reflector-controller-iamguarded" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert git ];
  labels = {
    "org.opencontainers.image.title" = "flux-image-reflector-controller-iamguarded";
    "org.opencontainers.image.description" = "Flux flux-image-reflector-controller-iamguarded";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
  };
}
