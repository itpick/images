{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# longhorn-ui-fips
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
  name = "longhorn-ui-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "longhorn-ui-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "longhorn-ui-fips";
      "org.opencontainers.image.description" = "longhorn-ui-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
