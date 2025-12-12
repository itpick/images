{ mkImage, pkgs, lib, ... }:

# Kubernetes Addon Resizer - Vertically scales addons based on cluster size
# https://github.com/kubernetes/autoscaler/tree/master/addon-resizer

let
  version = "1.8.23";

  addon-resizer = pkgs.buildGoModule rec {
    pname = "addon-resizer";
    inherit version;

    src = pkgs.fetchFromGitHub {
      owner = "kubernetes";
      repo = "autoscaler";
      rev = "addon-resizer-${version}";
      sha256 = "1lafnkiqbhn6dgamac4xdlh5mkh3cd0pb9kbmg7qwkh8mkdhh0s0";
    };

    vendorHash = null;  # Uses vendor directory

    subPackages = [ "addon-resizer" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes addon resizer - vertically scales addons based on cluster size";
      homepage = "https://github.com/kubernetes/autoscaler/tree/master/addon-resizer";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in mkImage {
  drv = addon-resizer;
  name = "addon-resizer";
  tag = "v${version}";
  entrypoint = [ "${addon-resizer}/bin/addon-resizer" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Kubernetes Addon Resizer";
    "org.opencontainers.image.description" = "Vertically scales Kubernetes addons based on cluster size";
    "org.opencontainers.image.version" = version;
  };
}
