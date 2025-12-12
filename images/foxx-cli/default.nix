{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# foxx-cli
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
  name = "foxx-cli";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "foxx-cli-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "foxx cli";
      "org.opencontainers.image.description" = "foxx-cli container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
