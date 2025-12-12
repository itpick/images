{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-kustomize-controller
# Flux GitOps component

let
  version = "2.4.0";
  flux-component = buildGoModule {
    pname = "flux-kustomize-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "kustomize-controller";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = null;
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-kustomize-controller";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/kustomize-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux kustomize controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-kustomize-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
  };
}
