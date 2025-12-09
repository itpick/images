{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for snapshot-controller:
# Packages NOT in nixpkgs:
#   kubernetes-csi-external-snapshot-controller-8.4 (8.4.0-r1)

let
  version = "8.1.0";
  snapshot-controller = buildGoModule {
    pname = "snapshot-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-csi";
      repo = "external-snapshotter";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    subPackages = [ "cmd/snapshot-controller" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "CSI Snapshot Controller";
      homepage = "https://github.com/kubernetes-csi/external-snapshotter";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = snapshot-controller;
  name = "snapshot-controller";
  tag = "v${version}";
  entrypoint = [ "${snapshot-controller}/bin/snapshot-controller" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CSI Snapshot Controller";
    "org.opencontainers.image.description" = "Kubernetes CSI snapshot controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "snapshot-controller";
  };
}
