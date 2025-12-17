{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.12.0";
  csi-resizer = buildGoModule {
    pname = "csi-resizer";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-csi";
      repo = "external-resizer";
      rev = "v${version}";
      hash = "sha256-4YN4XzLjjhULfkxmgMpSVYK4H/snJDSnCdub6Vn7BFw=";
    };

    vendorHash = null;

    subPackages = [ "cmd/csi-resizer" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Sidecar container that watches Kubernetes PersistentVolumeClaim objects and triggers ControllerExpandVolume operations against a CSI endpoint";
      homepage = "https://github.com/kubernetes-csi/external-resizer";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = csi-resizer;
  name = "csi-resizer";
  tag = "v${version}";
  entrypoint = [ "${csi-resizer}/bin/csi-resizer" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CSI Resizer";
    "org.opencontainers.image.description" = "Kubernetes CSI external resizer sidecar";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "csi-driver";
  };
}
