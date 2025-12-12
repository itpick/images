{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# headlamp-plugin-flux-fips
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
  name = "headlamp-plugin-flux-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "headlamp-plugin-flux-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "headlamp-plugin-flux-fips";
      "org.opencontainers.image.description" = "headlamp-plugin-flux-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
