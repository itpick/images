{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ratify-fips-sbom
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
  name = "ratify-fips-sbom";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ratify-fips-sbom-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ratify fips suom";
      "org.opencontainers.image.description" = "ratify-fips-sbom container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
