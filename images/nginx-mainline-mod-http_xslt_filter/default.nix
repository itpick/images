{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-mainline-mod-http_xslt_filter
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
  name = "nginx-mainline-mod-http_xslt_filter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-mainline-mod-http_xslt_filter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nginx mainline mod http_xslt_filter";
      "org.opencontainers.image.description" = "nginx-mainline-mod-http_xslt_filter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
