{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# helm-chartmuseum-fips
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
  name = "helm-chartmuseum-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "helm-chartmuseum-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "helm-chartmuseum-fips";
      "org.opencontainers.image.description" = "helm-chartmuseum-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
