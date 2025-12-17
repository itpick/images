{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-kustomize-controller
# Flux GitOps component

let
  version = "1.3.0";
  flux-component = buildGoModule {
    pname = "flux-kustomize-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "kustomize-controller";
      rev = "v${version}";
      hash = "sha256-gKL8sD7qJaY46AKzg3oawnrt3HJHyYZsK/umDGGO+Hk=";
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
