{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver-cuda
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
  name = "tritonserver-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "tritonserver cuda";
      "org.opencontainers.image.description" = "tritonserver-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
