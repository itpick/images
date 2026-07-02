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

  imagePackages = [
    nexus
    pkgs.openjdk17_headless # Nexus' install4j launcher needs a JVM 1.8–17
    pkgs.bash
    pkgs.coreutils
    pkgs.gnugrep
    pkgs.gawk # the install4j nexus launcher parses with awk
    pkgs.procps
    pkgs.cacert
  ];

  # Nexus writes everything under /nexus-data (karaf data: db, blobs, logs,
  # tmp, javaprefs). buildEnv would leave it a read-only store dir, so declare a
  # real writable /nexus-data + /sonatype-work in their own layer (mirrors the
  # nginx/minio writable-dirs scaffold + the official sonatype/nexus3 image,
  # which runs on a writable /nexus-data).
  writableDirs = pkgs.runCommand "nexus-writable-dirs" { } ''
    mkdir -p $out/nexus-data $out/sonatype-work/nexus3 $out/tmp
  '';

in
nix2container.buildImage {
  name = "nexus";
  tag = "v${version}";

  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (pkgs.buildEnv {
          name = "nexus-root";
          paths = imagePackages;
          pathsToLink = [ "/bin" "/etc" "/lib" "/share" ];
        })
      ];
    })
    (nix2container.buildLayer {
      copyToRoot = [ writableDirs ];
      perms = [
        {
          path = writableDirs;
          regex = "/(nexus-data|sonatype-work).*";
          mode = "0777";
        }
        {
          path = writableDirs;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })
  ];

  # NB: config keys are the OCI-capitalised names (Entrypoint/Cmd/Env/…). The
  # previous lowercase keys (entrypoint/cmd/env) were silently ignored by
  # nix2container, leaving the image with NO command -> "no command specified".
  config = {
    Entrypoint = [ "${nexus}/bin/nexus" ];
    Cmd = [ "run" ];
    WorkingDir = "/nexus-data";
    ExposedPorts = {
      "8081/tcp" = { };
    };
    Env = [
      # The install4j launcher + nexus scripts shell out to awk/grep/ps.
      "PATH=/bin"
      "NEXUS_HOME=${nexus}"
      "NEXUS_DATA=/nexus-data"
      "SONATYPE_WORK=/sonatype-work"
      # install4j finds the JVM via INSTALL4J_JAVA_HOME, not JAVA_HOME.
      "INSTALL4J_JAVA_HOME=${pkgs.openjdk17_headless}"
      "JAVA_HOME=${pkgs.openjdk17_headless}"
      # Modest heap so it fits the CI runner (default was 2703m).
      "INSTALL4J_ADD_VM_PARAMS=-Xms1200m -Xmx1200m -XX:MaxDirectMemorySize=1200m -Djava.util.prefs.userRoot=/nexus-data/javaprefs -Dkaraf.data=/nexus-data"
    ];
    Labels = {
      "org.opencontainers.image.title" = "Nexus Repository Manager";
      "org.opencontainers.image.description" = "Sonatype Nexus Repository Manager for software artifacts";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "nexus";
    };
  };
}
