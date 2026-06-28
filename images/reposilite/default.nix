{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# reposilite - lightweight Maven repository manager
# https://reposilite.com/

let
  imagePkgs = with pkgs; [
    reposilite
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Reposilite self-initializes its config + data in the working directory and
  # binds 0.0.0.0:8080 headless (printing a temporary admin token). Point the
  # working dir at writable /tmp; buildEnv otherwise leaves /tmp a read-only
  # store symlink, so materialize it as a real writable dir.
  writableDirs = pkgs.runCommand "reposilite-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in nix2container.buildImage {
  name = "reposilite";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.reposilite.version;

  # Separate layers so the writable /tmp scaffold declares its own perms
  # without colliding with buildEnv's read-only /tmp symlink.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "reposilite-root";
          paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
        })
      ];
    })
    (nix2container.buildLayer {
      copyToRoot = [ writableDirs ];
      perms = [
        {
          path = writableDirs;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    # The stub had no Cmd. Run the server with a writable working directory so
    # the kind probe reaches a Running pod with no extra wiring.
    Cmd = [ "reposilite" "--working-directory=/tmp/reposilite" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "reposilite";
      "org.opencontainers.image.description" = "Lightweight Maven repository manager";
      "org.opencontainers.image.version" = pkgs.reposilite.version;
      "io.nix-containers.image.upstream" = "https://reposilite.com/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "reposilite,maven,repository,artifacts";
    };
  };
}
