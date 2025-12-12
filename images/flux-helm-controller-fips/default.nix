{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-helm-controller-fips
# Flux GitOps component

let
  version = "2.4.0";
  flux-component = buildGoModule {
    pname = "flux-helm-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "helm-controller";
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

in
mkImage {
  drv = flux-component;
  name = "flux-helm-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/helm-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux helm controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-helm-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
