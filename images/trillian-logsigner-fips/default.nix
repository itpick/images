{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trillian-logsigner-fips
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
  name = "trillian-logsigner-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "trillian-logsigner-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trillian-logsigner-fips";
      "org.opencontainers.image.description" = "trillian-logsigner-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
