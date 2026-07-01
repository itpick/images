{ mkImage, pkgs, lib, ... }:

# Apache Cassandra - Distributed NoSQL database
# https://cassandra.apache.org/

let
  # Cassandra writes its data/commitlog/saved_caches (under cassandra.storagedir)
  # and its logs (system.log + JVM gc.log, under CASSANDRA_LOG_DIR) — all of
  # which default to the read-only install, so `cassandra -f` fatally fails to
  # create them ("mkdir: .../logs: Permission denied"). Point both at the
  # writable /tmp: CASSANDRA_LOG_DIR via env (cassandra-env.sh only defaults it
  # when unset) and cassandra.storagedir via -D below. The entrypoint pre-creates
  # the log dir so the startup mkdir succeeds. writeShellApplication runs
  # shellcheck at build time.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.coreutils ];
    text = ''
      STORAGE="''${CASSANDRA_STORAGEDIR:-/tmp/cassandra}"
      mkdir -p "$STORAGE/logs"
      exec "${pkgs.cassandra}/bin/cassandra" -f -Dcassandra.storagedir="$STORAGE" "$@"
    '';
  };
in
mkImage {
  drv = pkgs.cassandra;
  name = "cassandra";
  tag = "v${pkgs.cassandra.version}";
  # Was `cassandra -f` with no env — exits because the default data/log dirs
  # (the read-only install) aren't writable. Run through the entrypoint above.
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [ ];

  extraPkgs = with pkgs; [ openjdk21_headless bash coreutils ];

  env = {
    CASSANDRA_LOG_DIR = "/tmp/cassandra/logs";
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "Apache Cassandra";
    "org.opencontainers.image.description" = "Distributed NoSQL database management system";
    "org.opencontainers.image.version" = pkgs.cassandra.version;
  };
}
