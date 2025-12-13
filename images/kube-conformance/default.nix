{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-conformance
# Kubernetes component

let
  version = "1.34.0";
  kube-conformance = buildGoModule {
    pname = "kube-conformance";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/conformance" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-conformance;
  name = "kube-conformance";
  tag = "v${version}";
  entrypoint = [ "${kube-conformance}/bin/conformance" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue conformance";
    "org.opencontainers.image.description" = "Kubernetes kube-conformance";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
