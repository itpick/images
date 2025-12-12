{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgresql-17-base
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
  name = "postgresql-17-base";
  tag = pkgs.postgresql.version;
  copyToRoot = [
    (buildEnv {
      name = "postgresql-17-base-root";
      paths = base.basePackages ++ pgPkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PGDATA=/var/lib/postgresql/data"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "postgresql 17 base";
      "org.opencontainers.image.description" = "PostgreSQL postgresql-17-base";
      "org.opencontainers.image.version" = pkgs.postgresql.version;
    };
  };
}
