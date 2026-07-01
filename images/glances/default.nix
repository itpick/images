{ mkImage, pkgs, lib, ... }:

# Glances - System monitoring tool
# https://nicolargo.github.io/glances/

mkImage {
  drv = pkgs.glances;
  name = "glances";
  tag = "v${pkgs.glances.version}";
  entrypoint = [ "${pkgs.glances}/bin/glances" ];
  # Was `--version` (a one-shot, so the kind-test pod CrashLoops). Run Glances in
  # web-server mode (`-w`): it serves the monitoring dashboard + REST API via
  # Uvicorn on :61208, and --bind 0.0.0.0 makes it reachable by the kind-test
  # probe (default is localhost). No config or writable dir needed. Operators
  # can add --password / a config for auth and custom thresholds.
  cmd = [ "-w" "--bind" "0.0.0.0" ];

  # Glances builds its log filename from getpass.getuser(), which needs $USER or
  # an /etc/passwd entry — the nonroot pod has neither (mkImage ships no passwd,
  # and uid 65534 is unset), so glances crashes with "No username set in the
  # environment". Setting USER makes getpass.getuser() resolve without a passwd
  # lookup (and the log then lands in the writable /tmp).
  env = {
    USER = "glances";
  };

  labels = {
    "org.opencontainers.image.title" = "Glances";
    "org.opencontainers.image.description" = "Cross-platform system monitoring tool";
    "org.opencontainers.image.version" = pkgs.glances.version;
  };
}
