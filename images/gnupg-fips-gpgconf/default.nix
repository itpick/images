{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gnupg-fips-gpgconf
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
  name = "gnupg-fips-gpgconf";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gnupg-fips-gpgconf-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gnupg fips gpgconf";
      "org.opencontainers.image.description" = "gnupg-fips-gpgconf container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
