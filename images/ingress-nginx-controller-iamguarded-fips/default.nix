{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ingress-nginx-controller-iamguarded-fips
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
  name = "ingress-nginx-controller-iamguarded-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "ingress-nginx-controller-iamguarded-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ingress-nginx-controller-iamguarded-fips";
      "org.opencontainers.image.description" = "ingress-nginx-controller-iamguarded-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
