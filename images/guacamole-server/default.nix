{ mkImage, pkgs, lib, ... }:

# guacamole-server
# Container image packaging nixpkgs.guacamole-server
mkImage {
  drv = pkgs.guacamole-server;
  name = "guacamole-server";
  tag = "v${pkgs.guacamole-server.version}";
  entrypoint = [ (lib.getExe pkgs.guacamole-server) ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run guacd, the
  # Guacamole proxy daemon. By default guacd forks into the background — in a
  # container that exits PID 1, so the pod dies; -f keeps it in the foreground.
  # -b 0.0.0.0 binds all interfaces (default is localhost) so the kind-test
  # probe can reach the proxy on :4822, and -L info sets the log level. guacd is
  # configless (the protocol/params come from the client), so no config or
  # writable dir is needed. Mirrors the official guacamole/guacd image's cmd.
  cmd = [ "-b" "0.0.0.0" "-L" "info" "-f" ];

  labels = {
    "org.opencontainers.image.title" = "guacamole-server";
    "org.opencontainers.image.description" = "guacamole-server container image (nixpkgs.guacamole-server)";
    "org.opencontainers.image.version" = pkgs.guacamole-server.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
