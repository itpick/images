{ mkImage, pkgs, lib, ... }:

# pgpool2-nixchart
# ================
# pgpool-II for the charts/postgresql-ha chart. Chart mounts a real
# pgpool.conf via ConfigMap over /config; the smokeConf below only
# matters for standalone runs / kind smoke tests.

let
  # Minimal config for standalone runs — points at localhost (no real
  # backend), just enough to boot the process so smoke tests pass.
  smokeConf = pkgs.writeText "pgpool.conf" ''
    listen_addresses = '*'
    port = 9999
    pid_file_name = '/tmp/pgpool.pid'
    logdir = '/tmp'
    socket_dir = '/tmp'
    pcp_socket_dir = '/tmp'
    wd_ipc_socket_dir = '/tmp'
    backend_hostname0 = 'localhost'
    backend_port0 = 5432
    # Disable pool_passwd file lookup; chart mounts a real one via
    # ConfigMap. Empty string turns off the feature.
    pool_passwd = '''
  '';

  configRoot = pkgs.runCommand "pgpool2-nixchart-config" {} ''
    mkdir -p $out/config
    cp ${smokeConf} $out/config/pgpool.conf
  '';

  # pgpool calls getpwuid() at startup and refuses to run for an unknown
  # UID. Ship a passwd entry for 1001. Chart's securityContext handles
  # this differently in k8s.
  passwdEntry = pkgs.runCommand "pgpool2-nixchart-passwd" {} ''
    mkdir -p $out/etc
    cat > $out/etc/passwd <<'EOF'
    root:x:0:0:root:/root:/bin/bash
    pgpool:x:1001:0:pgpool:/tmp:/bin/bash
    EOF
    cat > $out/etc/group <<'EOF'
    root:x:0:
    EOF
  '';
in
mkImage {
  drv = pkgs.buildEnv {
    name = "pgpool2-nixchart-env";
    paths = [ pkgs.pgpool configRoot passwdEntry pkgs.bash pkgs.coreutils pkgs.cacert ];
  };
  name = "pgpool2-nixchart";
  tag = "v${pkgs.pgpool.version}";
  entrypoint = [ "${pkgs.pgpool}/bin/pgpool" ];
  cmd = [ "-n" "-f" "/config/pgpool.conf" ];
  user = "1001:0";
  labels."org.opencontainers.image.title" = "pgpool2-nixchart";
  labels."org.opencontainers.image.description" = "pgpool for the nix-containers charts/postgresql-ha chart";
  labels."org.opencontainers.image.version" = pkgs.pgpool.version;
  labels."io.nix-containers.chart" = "postgresql-ha";
}
