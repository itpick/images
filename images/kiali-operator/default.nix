# kiali-operator
# =============
# Kiali Operator - Kubernetes operator for Kiali service mesh observability
# https://github.com/kiali/kiali-operator

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Kiali Operator manages the lifecycle of Kiali instances in Kubernetes

let
  version = "2.19.0";
  kiali-operator = buildGoModule {
    pname = "kiali-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "kiali";
      repo = "kiali-operator";
      rev = "v${version}";
      hash = "sha256-NKmlCUOvnp/9BQnKun3cgWWw1kvG7rIAVXek5cUnXAk=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kiali Operator for Kubernetes";
      homepage = "https://github.com/kiali/kiali-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = kiali-operator;
  name = "kiali-operator";
  tag = "v${version}";
  entrypoint = [ "${kiali-operator}/bin/kiali-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [
    bash
    coreutils
    cacert
    tini
  ];

  labels = {
    "org.opencontainers.image.title" = "Kiali Operator";
    "org.opencontainers.image.description" = "Kubernetes operator for Kiali service mesh observability";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kiali-operator";
  };
}
