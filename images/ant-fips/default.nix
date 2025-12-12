{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ant-fips
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "ant-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "ant-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ant-fips";
      "org.opencontainers.image.description" = "ant-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
