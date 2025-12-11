# kiali
# =============
# Kiali - Observability console for Istio service mesh
# https://github.com/kiali/kiali

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Kiali provides observability and management for Istio service mesh

let
  version = "2.19.0";
  kiali = buildGoModule {
    pname = "kiali";
    inherit version;

    src = fetchFromGitHub {
      owner = "kiali";
      repo = "kiali";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/kiali/kiali/status.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kiali - Observability console for Istio service mesh";
      homepage = "https://github.com/kiali/kiali";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = kiali;
  name = "kiali";
  tag = "v${version}";
  entrypoint = [ "${kiali}/bin/kiali" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kiali";
    "org.opencontainers.image.description" = "Observability console for Istio service mesh";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kiali-server";
  };
}
