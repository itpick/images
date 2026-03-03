{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-image-automation-controller
# Flux GitOps component

let
  version = "0.38.0";
  flux-component = buildGoModule {
    pname = "flux-image-automation-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "image-automation-controller";
      rev = "v${version}";
      hash = "sha256-18NslR5XXTgZHfB9HXeRzWRPAaEfe6aZFfSW3mN4Ryc=";
    };

    vendorHash = "sha256-hJd4u8Dl21/bhqHopxU8PAZYhu1m84jxNljgX+GIax0=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-image-automation-controller";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/image-automation-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux image automation controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-image-automation-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
  };
}
