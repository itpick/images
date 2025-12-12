{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# infinispan-15.2-images
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
  name = "infinispan-15.2-images";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "infinispan-15.2-images-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "infinispan 15.2 images";
      "org.opencontainers.image.description" = "infinispan-15.2-images container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
