{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-image-reflector-controller-fips
# Flux GitOps component

let
  version = "1.2.1";
  flux-component = buildGoModule {
    pname = "flux-image-reflector-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "image-reflector-controller";
      rev = "v${version}";
      hash = "sha256-Qq3oaLSk7hg1/zeIBavSfRofgvo5EI8hYz4fHtzPX4w=";
    };

    proxyVendor = true;
    vendorHash = "sha256-AaUXdRqArk9bspc7/AFp63hOQwesCOE8efgSY/WDDac=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-image-reflector-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/image-reflector-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux image reflector controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-image-reflector-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
