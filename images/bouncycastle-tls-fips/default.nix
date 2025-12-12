{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bouncycastle-tls-fips
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
  name = "bouncycastle-tls-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bouncycastle-tls-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "uouncycastle tls fips";
      "org.opencontainers.image.description" = "bouncycastle-tls-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
