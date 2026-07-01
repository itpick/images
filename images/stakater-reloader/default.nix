{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

# stakater/Reloader — Kubernetes controller for rolling upgrades on ConfigMap/Secret changes.
# https://github.com/stakater/Reloader

let
  version = "1.4.17";
  reloader = buildGoModule {
    pname = "reloader";
    inherit version;

    src = fetchFromGitHub {
      owner = "stakater";
      repo = "Reloader";
      rev = "v${version}";
      hash = "sha256-V95gDRlP3noXbc1PO+U+g0LBoD6qlWG+EG3k2BNZTZI=";
    };

    proxyVendor = true;
    vendorHash = "sha256-H8ruUzLgCkhl4Yz9xEEDpuLED/Fr9Sg/RFwp8TBxKgg=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes controller to watch changes in ConfigMap and Secrets and trigger rolling upgrades";
      homepage = "https://github.com/stakater/Reloader";
      license = licenses.asl20;
    };
  };
in

mkImage {
  drv = reloader;
  name = "stakater-reloader";
  tag = "v${version}";
  entrypoint = [ "${reloader}/bin/Reloader" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Stakater Reloader";
    "org.opencontainers.image.description" = "Kubernetes controller to watch ConfigMaps and Secrets and trigger rolling upgrades";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "reloader";
  };
}
