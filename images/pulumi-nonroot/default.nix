{ mkImage, pkgs, lib, ... }:

# Pulumi (non-root) - Infrastructure as Code, runs as UID 65532
# https://www.pulumi.com/
#
# Identical to images/pulumi but with User = 65532:65532 so it satisfies
# Pod securityContext.runAsNonRoot = true (used e.g. by the
# pulumi-kubernetes-operator HelmRelease which defaults runAsNonRoot=true).
# UID 65532 matches the Chainguard / repo-wide "nonroot" convention defined
# in lib/nonRoot.nix.

mkImage {
  drv = pkgs.pulumi;
  name = "pulumi-nonroot";
  tag = "v${pkgs.pulumi.version}-nonroot";
  entrypoint = [ "${pkgs.pulumi}/bin/pulumi" ];
  cmd = [ "version" ];

  user = "65532:65532";

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "Pulumi (non-root)";
    "org.opencontainers.image.description" = "Modern infrastructure as code (runs as UID 65532)";
    "org.opencontainers.image.version" = pkgs.pulumi.version;
    "io.nix-containers.chart" = "pulumi-nonroot";
    "io.nix-containers.runas" = "nonroot";
  };
}
