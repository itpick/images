{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "4.8.1";
  csi-attacher = buildGoModule {
    pname = "csi-attacher";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-csi";
      repo = "external-attacher";
      rev = "v${version}";
      hash = "sha256-qJcnvAmMBqqYVzK7IBsVJl/d3/13t3EKUFrYMY8WatM=";
    };

    vendorHash = null;

    subPackages = [ "cmd/csi-attacher" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Sidecar container that watches Kubernetes VolumeAttachment objects and triggers ControllerPublish/Unpublish operations against a CSI endpoint";
      homepage = "https://github.com/kubernetes-csi/external-attacher";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = csi-attacher;
  name = "csi-attacher";
  tag = "v${version}";
  entrypoint = [ "${csi-attacher}/bin/csi-attacher" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CSI Attacher";
    "org.opencontainers.image.description" = "Kubernetes CSI external attacher sidecar";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "csi-driver";
  };
}
