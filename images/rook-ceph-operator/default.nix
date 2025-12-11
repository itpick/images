# rook-ceph-operator
# =============
# Rook Ceph Operator - Cloud-Native Storage Orchestrator for Kubernetes
# https://github.com/rook/rook

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Rook automates deployment and management of Ceph storage on Kubernetes

let
  version = "1.18.8";
  rook-operator = buildGoModule {
    pname = "rook";
    inherit version;

    src = fetchFromGitHub {
      owner = "rook";
      repo = "rook";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/rook" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/rook/rook/pkg/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Rook - Cloud-Native Storage Orchestrator for Kubernetes";
      homepage = "https://github.com/rook/rook";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = rook-operator;
  name = "rook-ceph-operator";
  tag = "v${version}";
  entrypoint = [ "${rook-operator}/bin/rook" ];
  cmd = [ "ceph" "operator" ];

  extraPkgs = with pkgs; [
    ceph          # Ceph client libraries and tools
    bash
    coreutils
    util-linux
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Rook Ceph Operator";
    "org.opencontainers.image.description" = "Rook - Cloud-Native Storage Orchestrator for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "rook-ceph";
  };
}
