{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-azure
# Crossplane provider/component

let
  version = "0.20.0";
  component = buildGoModule {
    pname = "crossplane-azure";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-azure";
      rev = "v${version}";
      hash = "sha256-nq9ME3PrUK269QT666RbCEKdA1OuDPn405qU8SLPWYs=";
    };
    vendorHash = "sha256-orQzhW4IFOdBm1roRr/80PBQSwAJCynPHhmSkEnma6M=";
    subPackages = [ "cmd/provider" ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-azure";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-azure";
    "org.opencontainers.image.description" = "Crossplane crossplane-azure";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
