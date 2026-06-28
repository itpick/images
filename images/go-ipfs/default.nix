{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# go-ipfs - Kubo, the reference IPFS implementation
# https://github.com/ipfs/kubo

let
  imagePkgs = with pkgs; [
    kubo
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # init the repo on first boot, bind API/gateway to 0.0.0.0, then run the
  # daemon. Without this the stub had no Cmd and no ipfs binary.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = imagePkgs;
    text = builtins.readFile ./docker-entrypoint.sh;
  };

  # The IPFS repo lives under writable /tmp. buildEnv otherwise leaves /tmp a
  # read-only store symlink, so materialize it as a real writable dir.
  writableDirs = pkgs.runCommand "go-ipfs-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in nix2container.buildImage {
  name = "go-ipfs";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.kubo.version;

  # Separate layers so the writable /tmp scaffold declares its own perms
  # without colliding with buildEnv's read-only /tmp symlink.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "go-ipfs-root";
          paths = base.basePackages ++ imagePkgs ++ [ userEnv entrypoint ];
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
    Entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
    Cmd = [ "daemon" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
      "IPFS_PATH=/tmp/ipfs"
    ];
    ExposedPorts = {
      "4001/tcp" = {};
      "5001/tcp" = {};
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "go-ipfs";
      "org.opencontainers.image.description" = "Kubo, the reference IPFS implementation";
      "org.opencontainers.image.version" = pkgs.kubo.version;
      "io.nix-containers.image.upstream" = "https://github.com/ipfs/kubo";
      "io.nix-containers.image.category" = "storage";
      "io.nix-containers.image.aliases" = "go-ipfs,kubo,ipfs";
    };
  };
}
