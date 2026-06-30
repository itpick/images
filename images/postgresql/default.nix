{ mkImage, pkgs, lib, ... }:

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
  # "could not look up effective user ID 65534". (Bake ONLY /etc/passwd+group —
  # not nonRoot.mkDefaultUserEnv, whose user-dirs derivation also bakes a /tmp
  # at mode 1777 that collides with mkImage's own /tmp in the nix2container
  # layer: "the file '/tmp' already exists in the tar ... but is overridden".)
  passwdEnv = pkgs.runCommand "postgresql-passwd" {} ''
    mkdir -p $out/etc
    printf 'root:x:0:0:root:/root:/bin/bash\nnobody:x:65534:65534:nobody:/nonexistent:/sbin/nologin\n' > $out/etc/passwd
    printf 'root:x:0:\nnobody:x:65534:\n' > $out/etc/group
    chmod 644 $out/etc/passwd $out/etc/group
  '';
in
mkImage {
  drv = pkgs.postgresql;
  name = "postgresql";
  tag = "v${pkgs.postgresql.version}";
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [];

  extraPkgs = [ entrypoint passwdEnv ];

  labels = {
    "org.opencontainers.image.title" = "PostgreSQL";
    "org.opencontainers.image.description" = "Powerful, open source object-relational database system";
    "org.opencontainers.image.version" = pkgs.postgresql.version;
  };
}
