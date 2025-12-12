{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver
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
  name = "tritonserver";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tritonserver";
      "org.opencontainers.image.description" = "tritonserver container image";
    };
  };
}
