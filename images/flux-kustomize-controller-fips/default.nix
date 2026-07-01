{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-kustomize-controller-fips
# Flux GitOps component

let
  version = "1.9.1";
  flux-component = buildGoModule {
    pname = "flux-kustomize-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "kustomize-controller";
      rev = "v${version}";
      hash = "sha256-1cMtlfjWR9YvRNokBrRwNixN1OJVaxehbg089UZkoKM=";
    };

    proxyVendor = true;
    vendorHash = "sha256-mrToj18Fvs+7hld3qDutp58nHlWSEngYl1hj4GpOjpk=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-kustomize-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/kustomize-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux kustomize controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-kustomize-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
