# kube-webhook-certgen
# =============
# Kubernetes webhook certificate generator
# Tools to help with self-signed cert generation for Kubernetes test environment
# https://github.com/jet/kube-webhook-certgen

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for kube-webhook-certgen:
# This is a Go binary that generates and manages webhook certificates

let
  version = "1.5.2";
  kube-webhook-certgen = buildGoModule {
    pname = "kube-webhook-certgen";
    inherit version;

    src = fetchFromGitHub {
      owner = "jet";
      repo = "kube-webhook-certgen";
      rev = "v${version}";
      hash = "sha256-gKgeUhZONSmLg3/ien7KkoI+m8x2rDWDlix2+Vt6CyU=";
    };

    vendorHash = null;  # Uses vendored dependencies

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/jet/kube-webhook-certgen/core.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes webhook certificate generator for self-signed certs";
      homepage = "https://github.com/jet/kube-webhook-certgen";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = kube-webhook-certgen;
  name = "kube-webhook-certgen";
  tag = "v${version}";
  entrypoint = [ "${kube-webhook-certgen}/bin/kube-webhook-certgen" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kube Webhook Certgen";
    "org.opencontainers.image.description" = "Kubernetes webhook certificate generator for self-signed certs";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "ingress-nginx";
  };
}
