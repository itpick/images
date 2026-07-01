{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-image-automation-controller-fips
# Flux GitOps component

let
  version = "1.2.1";
  flux-component = buildGoModule {
    pname = "flux-image-automation-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "image-automation-controller";
      rev = "v${version}";
      hash = "sha256-EL5A6jAMBT+4927+DzhzGX9k2zGiLHInn3uRi7nchjo=";
    };

    proxyVendor = true;
    vendorHash = "sha256-0R7V/cQAOjJ6s17BCoP2OFDQVlPnuvs4e/gNUgludPE=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-image-automation-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/image-automation-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux image automation controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-image-automation-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
