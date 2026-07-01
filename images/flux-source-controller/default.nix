{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-source-controller
# Flux GitOps component

let
  version = "1.9.1";
  flux-component = buildGoModule {
    pname = "flux-source-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "source-controller";
      rev = "v${version}";
      hash = "sha256-Uir+Z0MuLvZLE38imAbAX6hV8AtohwFa1fafT+gN17Y=";
    };

    vendorHash = "sha256-KGTy/yoIrQ/ds53tF5A5Rhmxk1DkFK7Z8IBqlG8xtro=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-source-controller";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/source-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux source controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-source-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
  };
}
