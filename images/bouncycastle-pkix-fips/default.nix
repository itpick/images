{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bouncycastle-pkix-fips
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
  name = "bouncycastle-pkix-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bouncycastle-pkix-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "uouncycastle pkix fips";
      "org.opencontainers.image.description" = "bouncycastle-pkix-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
