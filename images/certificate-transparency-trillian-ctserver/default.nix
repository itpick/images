{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# certificate-transparency-trillian-ctserver
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
  name = "certificate-transparency-trillian-ctserver";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "certificate-transparency-trillian-ctserver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "certificate transparency trillian ctserver";
      "org.opencontainers.image.description" = "certificate-transparency-trillian-ctserver container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
