{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# guacamole-server
# Container image

let
  imagePkgs = with pkgs; [
    guacamole-server
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "guacamole-server";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.guacamole-server.version;
  copyToRoot = [
    (buildEnv {
      name = "guacamole-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    ExposedPorts = {
      "4822/tcp" = {};
    };
    # Was empty -> the bare image had no command (kind-test 'no command
    # specified'). guacd is the Guacamole proxy daemon; it forks into the
    # background by default, so a container without -f would exit immediately.
    # Run it in the foreground (-f), bound to all interfaces (-b 0.0.0.0) so
    # the guacamole web app / kind-test probe can reach the default 4822 proxy
    # port. Binary lives in /sbin (autotools sbindir), wrapped with its own
    # LD_LIBRARY_PATH for the freerdp/vnc/ssh protocol plugins.
    Entrypoint = [ "${pkgs.guacamole-server}/sbin/guacd" ];
    Cmd = [ "-b" "0.0.0.0" "-f" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "guacamole-server";
      "org.opencontainers.image.description" = "Clientless remote desktop gateway (Apache Guacamole proxy daemon, guacd)";
      "org.opencontainers.image.version" = pkgs.guacamole-server.version;
    };
  };
}
