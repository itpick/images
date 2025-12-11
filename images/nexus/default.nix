# nexus
# =============
# Sonatype Nexus Repository Manager - Artifact repository manager
# https://github.com/sonatype/nexus-public
#
# Nexus Repository Manager is a Java application that manages software artifacts.

{ nix2container, pkgs, lib, ... }:

# Nexus is available in nixpkgs

let
  nexus = pkgs.nexus;
  version = nexus.version;

in
nix2container.buildImage {
  name = "nexus";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "nexus-root";
    paths = [
      # Nexus application
      nexus

      # Java runtime (Nexus comes with its own bundled JRE, but we include one for tools)
      pkgs.openjdk17_headless

      # Shell and utilities
      pkgs.bash
      pkgs.coreutils
      pkgs.gnugrep
      pkgs.procps

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "nexus-dirs" {} ''
        mkdir -p $out/nexus-data
        mkdir -p $out/sonatype-work/nexus3
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/nexus-data" "/sonatype-work" "/tmp" ];
  };

  config = {
    entrypoint = [ "${nexus}/bin/nexus" ];
    cmd = [ "run" ];
    workingDir = "/nexus-data";
    exposedPorts = {
      "8081/tcp" = {};
    };
    env = [
      "NEXUS_HOME=${nexus}"
      "NEXUS_DATA=/nexus-data"
      "SONATYPE_WORK=/sonatype-work"
      "INSTALL4J_ADD_VM_PARAMS=-Xms2703m -Xmx2703m -XX:MaxDirectMemorySize=2703m -Djava.util.prefs.userRoot=/nexus-data/javaprefs"
    ];
    labels = {
      "org.opencontainers.image.title" = "Nexus Repository Manager";
      "org.opencontainers.image.description" = "Sonatype Nexus Repository Manager for software artifacts";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "nexus";
    };
  };
}
