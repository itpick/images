{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ingress-nginx-custom-error-pages-fips
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
  name = "ingress-nginx-custom-error-pages-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ingress-nginx-custom-error-pages-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ingress nginx custom error pages fips";
      "org.opencontainers.image.description" = "ingress-nginx-custom-error-pages-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
