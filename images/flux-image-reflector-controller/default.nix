{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-image-reflector-controller
# Flux GitOps component

let
  version = "0.32.0";
  flux-component = buildGoModule {
    pname = "flux-image-reflector-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "image-reflector-controller";
      rev = "v${version}";
      hash = "sha256-D4hKUTUwS1Vk6XZM150HiAMZp5veJzNYkyJC/c4bK/U=";
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
  name = "flux-image-reflector-controller";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/image-reflector-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux image reflector controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-image-reflector-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
  };
}
