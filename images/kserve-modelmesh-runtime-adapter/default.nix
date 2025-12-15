{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kserve-modelmesh-runtime-adapter
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
  name = "kserve-modelmesh-runtime-adapter";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kserve-modelmesh-runtime-adapter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "kserve-modelmesh-runtime-adapter";
      "org.opencontainers.image.description" = "kserve-modelmesh-runtime-adapter container image";
    };
  };
}
