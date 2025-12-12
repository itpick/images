{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gnupg-fips-wks-client
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
  name = "gnupg-fips-wks-client";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gnupg-fips-wks-client-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gnupg fips wks client";
      "org.opencontainers.image.description" = "gnupg-fips-wks-client container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
