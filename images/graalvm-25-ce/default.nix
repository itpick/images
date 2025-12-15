{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# graalvm-25-ce
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
  name = "graalvm-25-ce";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "graalvm-25-ce-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "graalvm 25 ce";
      "org.opencontainers.image.description" = "graalvm-25-ce container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
