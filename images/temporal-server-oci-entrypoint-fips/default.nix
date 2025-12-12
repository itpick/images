{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# temporal-server-oci-entrypoint-fips
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
  name = "temporal-server-oci-entrypoint-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "temporal-server-oci-entrypoint-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "temporal server oci entrypoint fips";
      "org.opencontainers.image.description" = "temporal-server-oci-entrypoint-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
