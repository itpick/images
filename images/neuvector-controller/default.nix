# neuvector-controller
# =============
# NeuVector Controller - Container security controller
# https://github.com/neuvector/neuvector
#
# NeuVector Controller is the main management component that handles
# policy enforcement and security scanning coordination.

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

let
  version = "5.4.7";
  neuvector-controller = buildGoModule {
    pname = "neuvector-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "neuvector";
      repo = "neuvector";
      rev = "v${version}";
      hash = "sha256-I+U034mud+8AgSBsovXcNMEy7f6eTsJQWw+9wdQmkuc=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-I+U034mud+8AgSBsovXcNMEy7f6eTsJQWw+9wdQmkuc=";  # TODO: Fix hash after first build

    subPackages = [ "controller" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "NeuVector Controller - Container security management";
      homepage = "https://github.com/neuvector/neuvector";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = neuvector-controller;
  name = "neuvector-controller";
  tag = "v${version}";
  entrypoint = [ "${neuvector-controller}/bin/controller" ];
  cmd = [];

  extraPkgs = with pkgs; [
    bash
    busybox
    cacert
    consul
    ethtool
    iproute2
    procps
  ];

  labels = {
    "org.opencontainers.image.title" = "NeuVector Controller";
    "org.opencontainers.image.description" = "Container security controller for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "neuvector";
  };
}
