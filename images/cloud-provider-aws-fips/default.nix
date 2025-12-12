{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloud-provider-aws-fips
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
  name = "cloud-provider-aws-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cloud-provider-aws-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cloud-provider-aws-fips";
      "org.opencontainers.image.description" = "cloud-provider-aws-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
