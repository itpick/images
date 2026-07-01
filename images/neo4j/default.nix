{ mkImage, pkgs, lib, ... }:

# Neo4j - Graph database
# https://neo4j.com/

let
  # `bin/neo4j` resolves NEO4J_HOME to the read-only store and writes its data,
  # run dir and logs (the log4j config points at
  # ${config:server.directories.logs}) under it — so `neo4j console` fatally
  # fails on the read-only rootfs ("logs/neo4j.log: Permission denied"). Raw
  # bin/neo4j does not process NEO4J_* env vars (that's the official image's
  # entrypoint job), so seed a writable NEO4J_CONF under /tmp on first start:
  # copy the packaged conf, point the data/logs/run dirs at /tmp, bind 0.0.0.0,
  # and (dev default) disable auth. writeShellApplication runs shellcheck at
  # build. Operators mount their own conf + a PVC for the data dir.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.coreutils ];
    text = ''
      HOMEDIR="''${NEO4J_DATA_HOME:-/tmp/neo4j}"
      CONF="$HOMEDIR/conf"
      mkdir -p "$HOMEDIR/data" "$HOMEDIR/logs" "$HOMEDIR/run"
      if [ ! -f "$CONF/neo4j.conf" ]; then
        cp -r "${pkgs.neo4j}/share/neo4j/conf" "$CONF"
        chmod -R u+w "$CONF"
        {
          echo "server.directories.data=$HOMEDIR/data"
          echo "server.directories.logs=$HOMEDIR/logs"
          echo "server.directories.run=$HOMEDIR/run"
          echo "server.default_listen_address=0.0.0.0"
          echo "dbms.security.auth_enabled=false"
        } >> "$CONF/neo4j.conf"
      fi
      export NEO4J_CONF="$CONF"
      exec "${pkgs.neo4j}/bin/neo4j" console
    '';
  };
in
mkImage {
  drv = pkgs.neo4j;
  name = "neo4j";
  tag = "v${pkgs.neo4j.version}";
  # Was `neo4j console` with no env — fails to write data/logs on the read-only
  # rootfs. Run through the entrypoint above; Bolt binds 0.0.0.0:7687, HTTP 7474.
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [ ];

  extraPkgs = with pkgs; [ openjdk21_headless bash coreutils ];

  env = {
    JAVA_HOME = "${pkgs.openjdk21_headless}";
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "Neo4j";
    "org.opencontainers.image.description" = "Native graph database management system";
    "org.opencontainers.image.version" = pkgs.neo4j.version;
  };
}
