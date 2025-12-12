{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pulumi-language-nodejs
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
  name = "pulumi-language-nodejs";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pulumi-language-nodejs-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pulumi language nodejs";
      "org.opencontainers.image.description" = "pulumi-language-nodejs container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
