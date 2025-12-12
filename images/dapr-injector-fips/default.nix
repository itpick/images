{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dapr-injector-fips
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
  name = "dapr-injector-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dapr-injector-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dapr injector fips";
      "org.opencontainers.image.description" = "dapr-injector-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
