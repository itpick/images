{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-image-automation-controller
# Flux GitOps component

let
  version = "1.2.1";
  flux-component = buildGoModule {
    pname = "flux-image-automation-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "image-automation-controller";
      rev = "v${version}";
      hash = "sha256-EL5A6jAMBT+4927+DzhzGX9k2zGiLHInn3uRi7nchjo=";
    };

    vendorHash = "sha256-bFTic3uV92qEx5WZO9yY5aEDLVpMXsxsRMOiuet05RY=";
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
