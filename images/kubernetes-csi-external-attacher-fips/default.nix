{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# kubernetes-csi-external-attacher-fips
# Kubernetes component

let
  version = "1.34.0";
  kubernetes-csi-external-attacher = buildGoModule {
    pname = "kubernetes-csi-external-attacher-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "kubernetes";
      rev = "v${version}";
      hash = "sha256-rKy4X01pX+kovJ8b2JHV0KuzHJ7PYZ08eDEO3GeuPoc=";
    };

    vendorHash = null;
    subPackages = [ "cmd/csi-external-attacher" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = kubernetes-csi-external-attacher;
  name = "kubernetes-csi-external-attacher-fips";
  tag = "v${version}";
  entrypoint = [ "${kubernetes-csi-external-attacher}/bin/csi-external-attacher" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "kuuernetes csi external attacher";
    "org.opencontainers.image.description" = "Kubernetes kubernetes-csi-external-attacher";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kubernetes";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
