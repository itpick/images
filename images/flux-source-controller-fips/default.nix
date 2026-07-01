{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-source-controller-fips
# Flux GitOps component

let
  version = "1.9.1";
  flux-component = buildGoModule {
    pname = "flux-source-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "source-controller";
      rev = "v${version}";
      hash = "sha256-Uir+Z0MuLvZLE38imAbAX6hV8AtohwFa1fafT+gN17Y=";
    };

    proxyVendor = true;
    vendorHash = "sha256-dCM4+ALv53eK9pSEq+qQEqw+3xac0aODfCX5ar4qGM4=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-source-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/source-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux source controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-source-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
