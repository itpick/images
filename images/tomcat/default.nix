{ mkImage, pkgs, lib, ... }:

# Apache Tomcat - Java servlet container
# https://tomcat.apache.org/

let
  # catalina.sh needs JAVA_HOME and a writable CATALINA_BASE (it creates
  # logs/work/temp and writes conf/Catalina/<host> + deploys webapps). The image
  # rootfs is read-only, so build a CATALINA_BASE under the writable /tmp on
  # first start: writable logs/work/temp + a writable copy of conf, with lib/bin
  # symlinked from the read-only CATALINA_HOME, and an empty writable webapps for
  # operator-supplied apps. Without this Tomcat exits ("Neither JAVA_HOME nor
  # JRE_HOME") or logs SEVERE deployment errors on the read-only tree.
  # writeShellApplication runs shellcheck at build time.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.coreutils ];
    text = ''
      BASE="''${CATALINA_BASE:-/tmp/tomcat}"
      mkdir -p "$BASE/logs" "$BASE/work" "$BASE/temp" "$BASE/webapps"
      if [ ! -e "$BASE/conf" ]; then
        cp -r "${pkgs.tomcat}/conf" "$BASE/conf"
        chmod -R u+w "$BASE/conf"
      fi
      [ -e "$BASE/lib" ] || ln -s "${pkgs.tomcat}/lib" "$BASE/lib"
      [ -e "$BASE/bin" ] || ln -s "${pkgs.tomcat}/bin" "$BASE/bin"
      exec "${pkgs.tomcat}/bin/catalina.sh" run
    '';
  };
in
mkImage {
  drv = pkgs.tomcat;
  name = "tomcat";
  tag = "v${pkgs.tomcat.version}";
  # Was `catalina.sh run` with no env — exits because JAVA_HOME is unset and the
  # default CATALINA_BASE (the read-only install) isn't writable. Run through the
  # entrypoint above; Tomcat's default HTTP connector binds 0.0.0.0:8080.
  entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
  cmd = [ ];

  extraPkgs = with pkgs; [ openjdk21_headless bash coreutils ];

  env = {
    JAVA_HOME = "${pkgs.openjdk21_headless}";
    CATALINA_HOME = "${pkgs.tomcat}";
    CATALINA_BASE = "/tmp/tomcat";
    CATALINA_TMPDIR = "/tmp/tomcat/temp";
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "Apache Tomcat";
    "org.opencontainers.image.description" = "Java Servlet and JavaServer Pages implementation";
    "org.opencontainers.image.version" = pkgs.tomcat.version;
  };
}
