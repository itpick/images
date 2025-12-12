{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tofu-controller-runner-fips
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
  name = "tofu-controller-runner-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tofu-controller-runner-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tofu controller runner fips";
      "org.opencontainers.image.description" = "tofu-controller-runner-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
