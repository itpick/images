{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ratify-fips-licensechecker
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
  name = "ratify-fips-licensechecker";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ratify-fips-licensechecker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ratify fips licensechecker";
      "org.opencontainers.image.description" = "ratify-fips-licensechecker container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
