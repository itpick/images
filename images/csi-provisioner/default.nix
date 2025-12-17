{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "5.1.0";
  csi-provisioner = buildGoModule {
    pname = "csi-provisioner";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-csi";
      repo = "external-provisioner";
      rev = "v${version}";
      hash = "sha256-NmKfRgnVj4auBZp3SRX5yb3r4clMN7gNenPaaz3ZyTY=";
    };

    vendorHash = null;

    subPackages = [ "cmd/csi-provisioner" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Sidecar container that watches Kubernetes PersistentVolumeClaim objects and triggers CreateVolume/DeleteVolume operations against a CSI endpoint";
      homepage = "https://github.com/kubernetes-csi/external-provisioner";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = csi-provisioner;
  name = "csi-provisioner";
  tag = "v${version}";
  entrypoint = [ "${csi-provisioner}/bin/csi-provisioner" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CSI Provisioner";
    "org.opencontainers.image.description" = "Kubernetes CSI external provisioner sidecar";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "csi-driver";
  };
}
