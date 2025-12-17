{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "2.12.0";
  csi-node-driver-registrar = buildGoModule {
    pname = "csi-node-driver-registrar";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-csi";
      repo = "node-driver-registrar";
      rev = "v${version}";
      hash = "sha256-5uWpaIbD/bmAwLdwkU8GHxrSjD3bw0tibofTqumC+dA=";
    };

    vendorHash = null;

    subPackages = [ "cmd/csi-node-driver-registrar" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Sidecar container that fetches driver info from a CSI endpoint and registers it with the kubelet";
      homepage = "https://github.com/kubernetes-csi/node-driver-registrar";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = csi-node-driver-registrar;
  name = "csi-node-driver-registrar";
  tag = "v${version}";
  entrypoint = [ "${csi-node-driver-registrar}/bin/csi-node-driver-registrar" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "CSI Node Driver Registrar";
    "org.opencontainers.image.description" = "Kubernetes CSI node driver registrar sidecar";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "csi-driver";
  };
}
