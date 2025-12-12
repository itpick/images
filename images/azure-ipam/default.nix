{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azure-ipam
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
  name = "azure-ipam";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "azure-ipam-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "azure-ipam";
      "org.opencontainers.image.description" = "azure-ipam container image";
    };
  };
}
