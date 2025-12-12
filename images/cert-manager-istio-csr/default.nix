{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# cert-manager-istio-csr
# cert-manager component

let
  version = "1.16.0";
  component = buildGoModule {
    pname = "cert-manager-istio-csr";
    inherit version;
    src = fetchFromGitHub {
      owner = "cert-manager";
      repo = "cert-manager";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 0;
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "cert-manager-istio-csr";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/cert-manager-istio-csr" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata ];
  labels = {
    "org.opencontainers.image.title" = "cert-manager-istio-csr";
    "org.opencontainers.image.description" = "cert-manager cert-manager-istio-csr";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
