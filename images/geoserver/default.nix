{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# geoserver - open source server for sharing geospatial data
# https://geoserver.org/

let
  imagePkgs = with pkgs; [
    geoserver
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Seed a writable data dir from the read-only store default, then run the
  # foreground launcher. Without this the stub had no Cmd and no geoserver.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = imagePkgs;
    text = builtins.readFile ./docker-entrypoint.sh;
  };

  # GeoServer writes its data dir copy, log and Jetty tmp under /tmp. buildEnv
  # otherwise leaves /tmp a read-only store symlink, so materialize it.
  writableDirs = pkgs.runCommand "geoserver-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in nix2container.buildImage {
  name = "geoserver";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.geoserver.version;

  # Separate layers so the writable /tmp scaffold declares its own perms
  # without colliding with buildEnv's read-only /tmp symlink.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "geoserver-root";
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
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
      "GEOSERVER_HOME=${pkgs.geoserver}/share/geoserver"
      "GEOSERVER_DATA_DIR=/tmp/geoserver/data"
      # Keep the JVM modest for CI; force Jetty's tmp onto writable /tmp.
      "JAVA_OPTS=-Xms256m -Xmx512m -Djava.io.tmpdir=/tmp"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "geoserver";
      "org.opencontainers.image.description" = "Open source server for sharing geospatial data";
      "org.opencontainers.image.version" = pkgs.geoserver.version;
      "io.nix-containers.image.upstream" = "https://geoserver.org/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "geoserver,gis,wms,wfs";
    };
  };
}
