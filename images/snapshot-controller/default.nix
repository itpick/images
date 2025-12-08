{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

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
buildCLIImage {
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
