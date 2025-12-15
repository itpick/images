{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgresql-18-client
# PostgreSQL database component

let
  pgPkgs = with pkgs; [
    postgresql
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "postgresql-18-client";
  tag = pkgs.postgresql.version;
  copyToRoot = [
    (buildEnv {
      name = "postgresql-18-client-root";
      paths = base.basePackages ++ pgPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PGDATA=/var/lib/postgresql/data"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "postgresql 18 client";
      "org.opencontainers.image.description" = "PostgreSQL postgresql-18-client";
      "org.opencontainers.image.version" = pkgs.postgresql.version;
    };
  };
}
