{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.forgejo;
  name = "forgejo";
  tag = pkgs.forgejo.version;
  entrypoint = [ "${pkgs.forgejo}/bin/gitea" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ git openssh cacert bash gnupg ];

  env = {
    GITEA_WORK_DIR = "/var/lib/gitea";
    GITEA_CUSTOM = "/var/lib/gitea/custom";
    GITEA_TEMP = "/tmp/gitea";
    USER = "git";
    HOME = "/var/lib/gitea/git";
  };

  user = "1000:1000";

  labels = {
    "org.opencontainers.image.title" = "Forgejo";
    "org.opencontainers.image.description" = "Self-hosted Git service";
    "org.opencontainers.image.version" = pkgs.forgejo.version;
  };
}
