{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# PACKAGE_SUMMARY.md
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
  name = "PACKAGE_SUMMARY.md";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "PACKAGE_SUMMARY.md-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "PACKAGE_SUMMARY.md";
      "org.opencontainers.image.description" = "PACKAGE_SUMMARY.md container image";
    };
  };
}
