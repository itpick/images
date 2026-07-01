{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  packages = with pkgs; [
    minio
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # `minio server /data` writes its backend under /data, but buildEnv leaves the
  # rootfs read-only and never creates /data — minio then fatals at startup with
  # "Unable to initialize backend: file access denied" and the kind-test pod
  # crashes. Provide a writable /data owned by the nonroot uid (65532, the
  # default User) in its own layer, mirroring the nginx image's writable-dirs
  # scaffold. Operators mount their own volume at /data for persistence.
  writableDirs = pkgs.runCommand "minio-writable-dirs" { } ''
    mkdir -p $out/data
  '';

in
nix2container.buildImage {
  name = "minio";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  # Safe to flip off "latest" because the image already carries a runnable Cmd.
  tag = pkgs.minio.version;

  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "minio-root";
          paths = base.basePackages ++ packages ++ [ userEnv ];
        })
      ];
    })
    (nix2container.buildLayer {
      copyToRoot = [ writableDirs ];
      perms = [
        {
          path = writableDirs;
          regex = "/data";
          mode = "0755";
          uid = 65532;
          gid = 65532;
        }
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath packages}"
      "MINIO_ROOT_USER=minioadmin"
      "MINIO_ROOT_PASSWORD=minioadmin"
    ];
    ExposedPorts = {
      "9000/tcp" = {};
      "9001/tcp" = {};
    };
    Entrypoint = [ "${pkgs.minio}/bin/minio" ];
    Cmd = [ "server" "/data" "--address" "0.0.0.0:9000" "--console-address" ":9001" ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "High Performance Object Storage";
      "org.opencontainers.image.version" = pkgs.minio.version;
      "io.nix-containers.chart" = "loki,tempo";
    };
  };
}
