{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "8.2.0";
  csi-snapshotter = buildGoModule {
    pname = "csi-snapshotter";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-csi";
      repo = "external-snapshotter";
      rev = "v${version}";
      hash = "sha256-0000000000000000000000000000000000000000000=";
    };

    vendorHash = null;

    subPackages = [ "cmd/csi-snapshotter" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Sidecar container that watches Kubernetes VolumeSnapshot objects and triggers CreateSnapshot/DeleteSnapshot operations against a CSI endpoint";
      homepage = "https://github.com/kubernetes-csi/external-snapshotter";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = csi-snapshotter;
  name = "csi-snapshotter";
  tag = "v${version}";
  entrypoint = [ "${csi-snapshotter}/bin/csi-snapshotter" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CSI Snapshotter";
    "org.opencontainers.image.description" = "Kubernetes CSI external snapshotter sidecar";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "csi-driver";
  };
}
