{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver-backend-python-cuda
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
  name = "tritonserver-backend-python-cuda";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-backend-python-cuda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tritonserver uackend python cuda";
      "org.opencontainers.image.description" = "tritonserver-backend-python-cuda container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
