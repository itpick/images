{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# flux-notification-controller
# Flux GitOps component

let
  version = "1.3.0";
  flux-component = buildGoModule {
    pname = "flux-notification-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "notification-controller";
      rev = "v${version}";
      hash = "sha256-xZKGNf81SpaWaA/V5u2giKCsxM9nvVpnxhYIZ38dnqg=";
    };

    vendorHash = "sha256-cWlbPGz9BTyU1+vSqDTZL9f6klzsOHm8v6+wr54Ri2Q=";
    subPackages = [ "." ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = flux-component;
  name = "flux-notification-controller";
  tag = "v${version}";
  entrypoint = [ "${flux-component}/bin/notification-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "flux notification controller";
    "org.opencontainers.image.description" = "Flux GitOps flux-notification-controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux";
  };
}
