{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver-pytorch-backend-fips
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
  name = "tritonserver-pytorch-backend-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-pytorch-backend-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tritonserver-pytorch-backend-fips";
      "org.opencontainers.image.description" = "tritonserver-pytorch-backend-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
