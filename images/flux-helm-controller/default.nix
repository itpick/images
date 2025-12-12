{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-helm-controller
# Flux GitOps component

let
  version = "2.4.0";
  flux-component = buildGoModule {
    pname = "flux-helm-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "helm-controller";
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
  name = "flux-helm-controller";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/helm-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux helm controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-helm-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
  };
}
