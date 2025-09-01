{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  dotnetPackages = with pkgs; [
    dotnet-sdk_8
    git
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "dotnet";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "dotnet-root";
      paths = base.basePackages ++ dotnetPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath dotnetPackages}"
      "DOTNET_ROOT=${pkgs.dotnet-sdk_8}"
      "DOTNET_CLI_HOME=/home/nonroot/.dotnet"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = ".NET SDK for building applications";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.dotnet-sdk.version;
      "io.nix-containers.image.upstream" = "https://dotnet.microsoft.com/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "dotnet,csharp,fsharp,sdk";
    };
  };
}