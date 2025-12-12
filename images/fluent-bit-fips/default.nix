{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluent-bit-fips
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
  name = "fluent-bit-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "fluent-bit-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "fluent-bit-fips";
      "org.opencontainers.image.description" = "fluent-bit-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
