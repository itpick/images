{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pulumi-language-yaml
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
  name = "pulumi-language-yaml";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pulumi-language-yaml-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pulumi language yaml";
      "org.opencontainers.image.description" = "pulumi-language-yaml container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
