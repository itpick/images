{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azure-functions-python-fips
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
  name = "azure-functions-python-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "azure-functions-python-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "azure-functions-python-fips";
      "org.opencontainers.image.description" = "azure-functions-python-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
