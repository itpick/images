{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# containerd-shim-runc-v2
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
  name = "containerd-shim-runc-v2";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "containerd-shim-runc-v2-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "containerd shim runc v2";
      "org.opencontainers.image.description" = "containerd-shim-runc-v2 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
