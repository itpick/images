{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-source-controller-fips
# Flux GitOps component

let
  version = "1.3.0";
  flux-component = buildGoModule {
    pname = "flux-source-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "source-controller";
      rev = "v${version}";
      hash = "sha256-CdbwwSpPFRl/KdaIO+q2Tvc8+vuqUFLtdbf3oeVOFRQ=";
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
