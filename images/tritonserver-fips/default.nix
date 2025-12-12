{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver-fips
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
  name = "tritonserver-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tritonserver-fips";
      "org.opencontainers.image.description" = "tritonserver-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
