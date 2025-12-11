# snapshot-validation-webhook
# =============
# Kubernetes CSI Snapshot Validation Webhook
# Part of the external-snapshotter project
# https://github.com/kubernetes-csi/external-snapshotter

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Note: The validation webhook was deprecated in v8.0.0 and removed
# but is still used by some deployments

let
  version = "8.1.1";
  snapshot-validation-webhook = buildGoModule {
    pname = "snapshot-validation-webhook";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-csi";
      repo = "external-snapshotter";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/snapshot-validation-webhook" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes CSI Snapshot Validation Webhook";
      homepage = "https://github.com/kubernetes-csi/external-snapshotter";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = snapshot-validation-webhook;
  name = "snapshot-validation-webhook";
  tag = "v${version}";
  entrypoint = [ "${snapshot-validation-webhook}/bin/snapshot-validation-webhook" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Snapshot Validation Webhook";
    "org.opencontainers.image.description" = "Kubernetes CSI Snapshot Validation Webhook";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "snapshot-controller";
  };
}
