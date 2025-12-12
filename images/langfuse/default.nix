{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# langfuse
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
  name = "langfuse";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "langfuse-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "langfuse";
      "org.opencontainers.image.description" = "langfuse container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
