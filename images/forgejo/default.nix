{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.forgejo;
  name = "forgejo";
  tag = pkgs.forgejo.version;
  entrypoint = [ "${pkgs.forgejo}/bin/gitea" ];
  # Charts (forgejo's official chart, code.forgejo.org/forgejo/runner,
  # etc.) leave `command` and `args` unset on the container spec and
  # rely on the image's OCI Entrypoint+Cmd to start the web server.
  # Previously `cmd = [ "--help" ]` made the container print the usage
  # banner and exit 0 immediately, surfacing as a CrashLoopBackOff
  # whose stdout was just `GLOBAL OPTIONS:` rather than the expected
  # `Listening on http://0.0.0.0:3000`. `web` is gitea/forgejo's
  # canonical subcommand to start the long-running server process.
  cmd = [ "web" ];

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
