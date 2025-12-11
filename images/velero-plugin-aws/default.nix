# velero-plugin-aws
# =============
# Velero plugin for AWS S3 and EBS backup/restore
# https://github.com/vmware-tanzu/velero-plugin-for-aws

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for velero-plugin-aws:
# Packages available in nixpkgs:
#   pkgs.velero  # velero (1.17.1-r2)
#   pkgs.restic  # restic (0.18.1-r2)

let
  version = "1.10.1";
  velero-plugin-aws = buildGoModule {
    pname = "velero-plugin-for-aws";
    inherit version;

    src = fetchFromGitHub {
      owner = "vmware-tanzu";
      repo = "velero-plugin-for-aws";
      rev = "v${version}";
      hash = "sha256-kcZ9ZlPp6rW8MBF9GZj7mLkZ7L0fg8NjBVkB/a1YDNY=";
    };

    vendorHash = "sha256-tYp/JwXgZKxCHkwk/U1J/iVWPfg7FKyDO1y0kqgHE0Y=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Velero plugins for AWS";
      homepage = "https://github.com/vmware-tanzu/velero-plugin-for-aws";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = velero-plugin-aws;
  name = "velero-plugin-aws";
  tag = "v${version}";
  entrypoint = [ "/bin/sh" "-c" "cp /plugins/* /target/" ];
  cmd = [];

  extraPkgs = with pkgs; [ restic ];

  labels = {
    "org.opencontainers.image.title" = "Velero Plugin for AWS";
    "org.opencontainers.image.description" = "Velero plugins for AWS S3 and EBS";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "velero";
  };
}
