# velero-plugin-csi
# =============
# Velero plugin for CSI volume snapshots
# https://github.com/vmware-tanzu/velero-plugin-for-csi

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for velero-plugin-csi:
# Packages available in nixpkgs:
#   pkgs.velero  # velero (1.17.1-r2)
#   pkgs.restic  # restic (0.18.1-r2)

let
  version = "0.7.1";
  velero-plugin-csi = buildGoModule {
    pname = "velero-plugin-for-csi";
    inherit version;

    src = fetchFromGitHub {
      owner = "vmware-tanzu";
      repo = "velero-plugin-for-csi";
      rev = "v${version}";
      hash = "sha256-JgzJarBwLWewTmpaSdYlYzNLo07GFD085mzU2NF0NZQ=";
    };

    vendorHash = "sha256-9ymZzC3JkfSJxiI3WZIEE35y1ItgIgAKjrtwuluS/uI=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Velero plugins for CSI snapshots";
      homepage = "https://github.com/vmware-tanzu/velero-plugin-for-csi";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = velero-plugin-csi;
  name = "velero-plugin-csi";
  tag = "v${version}";
  entrypoint = [ "/bin/sh" "-c" "cp /plugins/* /target/" ];
  cmd = [];

  extraPkgs = with pkgs; [ restic ];

  labels = {
    "org.opencontainers.image.title" = "Velero Plugin for CSI";
    "org.opencontainers.image.description" = "Velero plugins for CSI volume snapshots";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "velero";
  };
}
