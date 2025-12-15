{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# local-static-provisioner
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
  name = "local-static-provisioner";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "local-static-provisioner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "local static provisioner";
      "org.opencontainers.image.description" = "local-static-provisioner container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
