{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kube-oidc-proxy
# Kubernetes component

let
  version = "1.34.0";
  kube-oidc-proxy = buildGoModule {
    pname = "kube-oidc-proxy";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/oidc-proxy" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kube-oidc-proxy;
  name = "kube-oidc-proxy";
  tag = "v${version}";
  entrypoint = [ "${kube-oidc-proxy}/bin/oidc-proxy" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuue oidc proxy";
    "org.opencontainers.image.description" = "Kubernetes kube-oidc-proxy";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
  };
}
