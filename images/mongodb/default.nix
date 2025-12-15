# mongodb
# =======
# MongoDB Community Server - Document database
# https://www.mongodb.com/
#
# Uses pre-built binary from MongoDB to avoid 90+ minute compile time.
# MongoDB is compiled via scons (C++) which takes extremely long.

{ nix2container, pkgs, lib, base, nonRoot, ... }:

let
  version = "8.0.16";

  # Download MongoDB Community Server binary
  # Using Ubuntu 22.04 build which works well with glibc
  mongodbBin = pkgs.fetchurl {
    url = "https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2204-${version}.tgz";
    hash = "sha256-XLE25XkwaDntbp2ZFHy/b4tJBxmMyrGi+Ch70S+pXNg=";
  };

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "mongodb";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "mongodb-root";
    paths = base.basePackages ++ [
      # Runtime dependencies
      pkgs.bash
      pkgs.coreutils
      pkgs.openssl
      pkgs.curl
      pkgs.cacert

      userEnv

      # Install MongoDB binary
      (pkgs.runCommand "mongodb-install" {} ''
        mkdir -p $out/opt/mongodb $out/bin $out/data/db $out/tmp

        # Extract MongoDB
        tar -xzf ${mongodbBin} --strip-components=1 -C $out/opt/mongodb

        # Create symlinks
        ln -sf $out/opt/mongodb/bin/mongod $out/bin/mongod
        ln -sf $out/opt/mongodb/bin/mongos $out/bin/mongos

        # Create data directory
        chmod 777 $out/data/db
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/opt" "/data" "/tmp" ];
  };

  config = nonRoot.defaultConfig // {
    Entrypoint = [ "/bin/mongod" ];
    Cmd = [ "--bind_ip_all" ];
    WorkingDir = "/data/db";
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=/opt/mongodb/bin:/bin"
      "MONGO_HOME=/opt/mongodb"
    ];
    ExposedPorts = {
      "27017/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "MongoDB";
      "org.opencontainers.image.description" = "MongoDB document database (binary download)";
      "org.opencontainers.image.version" = version;
      "org.opencontainers.image.url" = "https://www.mongodb.com/";
      "io.nix-containers.binary-download" = "true";
      "io.nix-containers.image.category" = "database";
    };
  };
}
