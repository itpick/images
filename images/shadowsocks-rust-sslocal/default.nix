{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# shadowsocks-rust-sslocal
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
  name = "shadowsocks-rust-sslocal";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "shadowsocks-rust-sslocal-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "shadowsocks rust sslocal";
      "org.opencontainers.image.description" = "shadowsocks-rust-sslocal container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
