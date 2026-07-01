{ mkImage, pkgs, lib, ... }:

# Eclipse Jetty - Java HTTP server and Servlet container
# https://www.eclipse.org/jetty/

let
  # Jetty 12 has no bin/jetty.sh (the old SysV wrapper is gone) — it runs via
  # `java -jar $JETTY_HOME/start.jar` from an initialized JETTY_BASE, so the old
  # entrypoint pointed at a missing file. The base also has to be writable
  # (Jetty writes start.d/, logs, work, webapps), which the read-only image
  # rootfs isn't. Build a JETTY_BASE under the writable /tmp on first start:
  # enable the server + http modules (binds an HTTP connector), then run it.
  # writeShellApplication runs shellcheck at build time.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.coreutils ];
    text = ''
      BASE="''${JETTY_BASE:-/tmp/jetty}"
      PORT="''${JETTY_HTTP_PORT:-8080}"
      mkdir -p "$BASE"
      if [ ! -d "$BASE/start.d" ]; then
        "${pkgs.openjdk21_headless}/bin/java" -jar "${pkgs.jetty}/start.jar" \
          "jetty.base=$BASE" --add-modules=server,http
      fi
      exec "${pkgs.openjdk21_headless}/bin/java" -jar "${pkgs.jetty}/start.jar" \
        "jetty.base=$BASE" jetty.http.host=0.0.0.0 "jetty.http.port=$PORT"
    '';
  };
in
mkImage {
  drv = pkgs.jetty;
  name = "jetty";
  tag = "v${pkgs.jetty.version}";
  # Was `${pkgs.jetty}/bin/jetty.sh run`, a path that doesn't exist in Jetty 12.
  # Run through the entrypoint above; the http module binds 0.0.0.0:8080.
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [ ];

  extraPkgs = with pkgs; [ openjdk21_headless bash coreutils cacert ];

  env = {
    JETTY_HOME = "${pkgs.jetty}";
    JETTY_BASE = "/tmp/jetty";
    JAVA_HOME = "${pkgs.openjdk21_headless}";
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "Eclipse Jetty";
    "org.opencontainers.image.description" = "Java HTTP server and Servlet container";
    "org.opencontainers.image.version" = pkgs.jetty.version;
  };
}
