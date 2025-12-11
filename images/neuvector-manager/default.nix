# neuvector-manager
# =============
# NeuVector Manager - Web UI for NeuVector
# https://github.com/neuvector/manager
#
# NeuVector Manager provides the web-based management console.
# It's a Java-based web application.

{ nix2container, pkgs, lib, ... }:

let
  version = "5.4.7";

in
nix2container.buildImage {
  name = "neuvector-manager";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "neuvector-manager-root";
    paths = with pkgs; [
      # Java runtime
      openjdk17_headless

      # Shell and utilities
      bash
      busybox
      coreutils
      procps
      iproute2

      # SSL/TLS
      cacert

      # Create directories
      (pkgs.runCommand "neuvector-manager-dirs" {} ''
        mkdir -p $out/usr/local/bin
        mkdir -p $out/etc/neuvector
        mkdir -p $out/var/log/neuvector
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/usr" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.openjdk17_headless}/bin/java" ];
    cmd = [ "-jar" "/usr/local/bin/manager.jar" ];
    workingDir = "/usr/local/bin";
    exposedPorts = {
      "8443/tcp" = {};
    };
    env = [
      "JAVA_HOME=${pkgs.openjdk17_headless}"
    ];
    labels = {
      "org.opencontainers.image.title" = "NeuVector Manager";
      "org.opencontainers.image.description" = "Web management console for NeuVector";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "neuvector";
    };
  };
}
