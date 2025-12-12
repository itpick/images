{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# temporal-admin-tools
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
  name = "temporal-admin-tools";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "temporal-admin-tools-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "temporal-admin-tools";
      "org.opencontainers.image.description" = "temporal-admin-tools container image";
    };
  };
}
