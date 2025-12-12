{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# httpd-fips
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
  name = "httpd-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "httpd-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "httpd-fips";
      "org.opencontainers.image.description" = "httpd-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
