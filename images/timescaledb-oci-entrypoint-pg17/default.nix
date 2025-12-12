{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# timescaledb-oci-entrypoint-pg17
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "timescaledb-oci-entrypoint-pg17";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "timescaledb-oci-entrypoint-pg17-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "timescaledu oci entrypoint pg17";
      "org.opencontainers.image.description" = "timescaledb-oci-entrypoint-pg17 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
