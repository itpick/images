{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-notification-controller-fips
# Flux GitOps component

let
  version = "1.9.1";
  flux-component = buildGoModule {
    pname = "flux-notification-controller-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "notification-controller";
      rev = "v${version}";
      hash = "sha256-x8UO9+4PmWhsned0ZTFJLdi+v8DZMSj6YXxD/XfQmxs=";
    };

    proxyVendor = true;
    vendorHash = "sha256-4aordFiVUW4JjyidfIyEqYwseN5V8WwN5PoxOPF043s=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-notification-controller-fips";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/notification-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux notification controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-notification-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
