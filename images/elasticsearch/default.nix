{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Elasticsearch search and analytics engine
# https://github.com/elastic/elasticsearch

let
  elasticsearchPackages = with pkgs; [
    elasticsearch
    openjdk17_headless  # ES 7.17 runs on JDK 17; the package has no bundled JRE
    bash
    busybox
    coreutils
    curl
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # docker-entrypoint: seed a writable config dir from the read-only store
  # defaults, overlay a single-node / security-off elasticsearch.yml, then
  # exec the server. Without this the image has no Cmd and can't start.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = elasticsearchPackages;
    text = builtins.readFile ./docker-entrypoint.sh;
  };

  # Elasticsearch writes its config copy, data, logs and tmp under /tmp.
  # buildEnv otherwise leaves /tmp a read-only store symlink, so materialize it
  # as a real writable dir (mirrors the nginx/caddy scaffold).
  writableDirs = pkgs.runCommand "elasticsearch-writable-dirs" {} ''
    mkdir -p $out/tmp
  '';

in
nix2container.buildImage {
  name = "elasticsearch";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.elasticsearch.version;

  # Separate layers so the writable /tmp scaffold declares its own perms
  # without colliding with buildEnv's read-only /tmp symlink.
  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "elasticsearch-root";
          paths = base.basePackages ++ elasticsearchPackages ++ [ userEnv entrypoint ];
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
    Cmd = [ "elasticsearch" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath elasticsearchPackages}"
      "ES_HOME=${pkgs.elasticsearch}"
      "ES_JAVA_HOME=${pkgs.openjdk17_headless}"
      # Keep the JVM small so it fits the CI runner; the single-node start only
      # needs to launch and stay up, not serve a workload.
      "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ];
    ExposedPorts = {
      "9200/tcp" = {};
      "9300/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Elasticsearch distributed search and analytics engine";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.elasticsearch.version;
      "io.nix-containers.image.upstream" = "https://www.elastic.co/elasticsearch/";
      "io.nix-containers.image.category" = "database";
      "io.nix-containers.image.aliases" = "elasticsearch,elastic,search";
    };
  };
}
