{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# shadowsocks-rust-ssserver
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
  name = "shadowsocks-rust-ssserver";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "shadowsocks-rust-ssserver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "shadowsocks rust ssserver";
      "org.opencontainers.image.description" = "shadowsocks-rust-ssserver container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
