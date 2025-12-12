{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# boringssl-fips-static-2023042800-tools
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
  name = "boringssl-fips-static-2023042800-tools";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "boringssl-fips-static-2023042800-tools-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "uoringssl fips static 2023042800 tools";
      "org.opencontainers.image.description" = "boringssl-fips-static-2023042800-tools container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
