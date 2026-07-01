{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# git-daemon
# https://git-scm.com/docs/git-daemon

let
  gitPackages = with pkgs; [
    git
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # git daemon needs its --base-path to exist (it serves the bare repos found
  # underneath). Bake an empty, read-only /srv/git: git daemon only reads the
  # base path, so no writable layer is needed. Operators mount their
  # repositories here.
  gitBase = pkgs.runCommand "git-daemon-base" { } ''
    mkdir -p $out/srv/git
  '';

in nix2container.buildImage {
  name = "git-daemon";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.git.version;
  copyToRoot = [
    (buildEnv {
      name = "git-daemon-root";
      paths = base.basePackages ++ gitPackages ++ [ userEnv gitBase ];
    })
  ];
  config = nonRoot.defaultConfig // {
    # Was a bare stub (no Cmd), so the kind-test pod fails with "no command
    # specified". Run the git protocol daemon in the foreground, listening on
    # 0.0.0.0:9418 and exporting bare repos under /srv/git. --export-all serves
    # every repo without a per-repo git-daemon-export-ok marker; the daemon
    # starts and listens even with zero repos present. Operators mount their
    # repositories under /srv/git.
    Entrypoint = [ "${pkgs.git}/bin/git" ];
    Cmd = [
      "daemon"
      "--reuseaddr"
      "--listen=0.0.0.0"
      "--port=9418"
      "--base-path=/srv/git"
      "--export-all"
    ];
    ExposedPorts = {
      "9418/tcp" = { };
    };
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath gitPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "git daemon";
      "org.opencontainers.image.description" = "Git protocol server (git daemon) for anonymous repository access";
      "org.opencontainers.image.version" = pkgs.git.version;
    };
  };
}
