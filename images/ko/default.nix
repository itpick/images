{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  koPackages = with pkgs; [
    ko
    go
    git
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "ko";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "ko-root";
      paths = base.basePackages ++ koPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath koPackages}"
      "GOPATH=/home/nonroot/go"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Build and deploy Go applications on Kubernetes";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://ko.build/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "ko,kubernetes,golang,build";
    };
  };
}