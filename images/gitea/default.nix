{ buildCLIImage, pkgs, lib, ... }:

# Gitea - Self-hosted Git service
# This is a placeholder for future Gitea images
# Gitea has multiple components: server, act runner, etc.

buildCLIImage {
  drv = pkgs.gitea;
  name = "gitea";
  tag = pkgs.gitea.version;
  entrypoint = [ "${pkgs.gitea}/bin/gitea" ];
  cmd = [ "--help" ];

  env = {
    GITEA_WORK_DIR = "/var/lib/gitea";
    GITEA_CUSTOM = "/var/lib/gitea/custom";
  };

  labels = {
    "org.opencontainers.image.title" = "Gitea";
    "org.opencontainers.image.description" = "Self-hosted Git service";
    "org.opencontainers.image.version" = pkgs.gitea.version;
    "io.nix-containers.chart" = "gitea";
  };
}
