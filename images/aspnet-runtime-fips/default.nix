{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# aspnet-runtime-fips
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
  name = "aspnet-runtime-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "aspnet-runtime-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "aspnet-runtime-fips";
      "org.opencontainers.image.description" = "aspnet-runtime-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
