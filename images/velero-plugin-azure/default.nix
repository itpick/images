# velero-plugin-azure
# =============
# Velero plugin for Azure Blob Storage and Azure Managed Disks
# https://github.com/vmware-tanzu/velero-plugin-for-microsoft-azure

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for velero-plugin-azure:
# Packages available in nixpkgs:
#   pkgs.velero  # velero (1.17.1-r2)

let
  version = "1.10.1";
  velero-plugin-azure = buildGoModule {
    pname = "velero-plugin-for-microsoft-azure";
    inherit version;

    src = fetchFromGitHub {
      owner = "vmware-tanzu";
      repo = "velero-plugin-for-microsoft-azure";
      rev = "v${version}";
      hash = "sha256-D/ExM7/tnKoMIIPkgrVZ9Livg+cU+H3Y7NVHmXL9KR8=";
    };

    vendorHash = "sha256-ObvgHafHWHSSNPmrRP63eiiB9QZ01fIUFvgBZv3A5+s=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Velero plugins for Microsoft Azure";
      homepage = "https://github.com/vmware-tanzu/velero-plugin-for-microsoft-azure";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = velero-plugin-azure;
  name = "velero-plugin-azure";
  tag = "v${version}";
  entrypoint = [ "/bin/sh" "-c" "cp /plugins/* /target/" ];
  cmd = [];

  extraPkgs = with pkgs; [ restic ];

  labels = {
    "org.opencontainers.image.title" = "Velero Plugin for Azure";
    "org.opencontainers.image.description" = "Velero plugins for Azure Blob Storage and Managed Disks";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "velero";
  };
}
