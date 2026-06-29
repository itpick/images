{ mkImage, pkgs, lib, ... }:

# Restic REST Server - REST backend for restic
# https://github.com/restic/rest-server

mkImage {
  drv = pkgs.restic-rest-server;
  name = "restic-rest-server";
  tag = "v${pkgs.restic-rest-server.version}";
  entrypoint = [ "${pkgs.restic-rest-server}/bin/rest-server" ];
  # Was `--help` (a one-shot). Serve on 0.0.0.0:8000 with the data dir under
  # the writable /tmp mkImage provides (rest-server creates it). --no-auth keeps
  # it smoke-test friendly; operators drop it and mount a .htpasswd.
  cmd = [
    "--listen" "0.0.0.0:8000"
    "--path" "/tmp/restic"
    "--no-auth"
  ];

  labels = {
    "org.opencontainers.image.title" = "Restic REST Server";
    "org.opencontainers.image.description" = "REST backend for restic";
    "org.opencontainers.image.version" = pkgs.restic-rest-server.version;
    "io.nix-containers.image.upstream" = "https://github.com/restic/rest-server";
    "io.nix-containers.image.category" = "storage";
    "io.nix-containers.image.aliases" = "restic-rest-server,rest-server,restic";
  };
}
