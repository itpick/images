{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# Argo Rollouts (FIPS) - Kubernetes Progressive Delivery Controller
# https://github.com/argoproj/argo-rollouts
# FIPS-compliant build for FedRAMP compliance

let
  version = "1.8.3";

  argo-rollouts-fips = buildGoModule rec {
    pname = "argo-rollouts-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "argoproj";
      repo = "argo-rollouts";
      rev = "v${version}";
      hash = "sha256-OCFbnBSFSXcbXHT48sS8REAt6CtNFPCNTIfKRBj19DM=";
    };

    vendorHash = "sha256-2zarm9ZvPJ5uwEYvYI60uaN5MONKE8gd+i6TPHdD3PU=";

    subPackages = [
      "cmd/rollouts-controller"
      "cmd/kubectl-argo-rollouts"
    ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/argoproj/argo-rollouts/utils/version.version=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Progressive Delivery for Kubernetes (FIPS) with FIPS-validated cryptography";
      homepage = "https://argoproj.github.io/argo-rollouts/";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = argo-rollouts-fips;
  name = "argo-rollouts-fips";
  tag = "v${version}";
  entrypoint = [ "${argo-rollouts-fips}/bin/rollouts-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Argo Rollouts (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant Kubernetes Progressive Delivery Controller for blue-green and canary deployments";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "argo-rollouts";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
