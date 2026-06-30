{ mkImage, pkgs, lib, nonRoot, ... }:

# PostgreSQL - Relational database
# https://www.postgresql.org/

let
  postgresPackages = with pkgs; [ postgresql bash coreutils ];

  # PostgreSQL is a two-step server: `initdb` creates the data dir, then
  # `postgres` runs it. The cmd was `--help` (a one-shot, so the kind-test pod
  # CrashLoops). Use a docker-entrypoint that initdb's on first boot then execs
  # the server (modelled on images/postgres), with PGDATA + the socket dir on
  # the writable /tmp and listen_addresses=0.0.0.0.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = postgresPackages;
    text = builtins.readFile ./docker-entrypoint.sh;
  };

  # postgres calls getpwuid(geteuid()); the default mkImage ships no /etc/passwd,
  # so bake one with the nonroot (65534) entry, else initdb/postgres FATAL with
  # "could not look up effective user ID 65534".
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];
in
mkImage {
  drv = pkgs.postgresql;
  name = "postgresql";
  tag = "v${pkgs.postgresql.version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [];

  extraPkgs = [ entrypoint userEnv ];

  labels = {
    "org.opencontainers.image.title" = "PostgreSQL";
    "org.opencontainers.image.description" = "Powerful, open source object-relational database system";
    "org.opencontainers.image.version" = pkgs.postgresql.version;
  };
}
