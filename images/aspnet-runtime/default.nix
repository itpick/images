{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  aspnetPackages = with pkgs; [
    dotnet-runtime_8
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "aspnet-runtime";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "aspnet-runtime-root";
      paths = base.basePackages ++ aspnetPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath aspnetPackages}"
      "DOTNET_ROOT=${pkgs.dotnet-runtime_8}"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "ASP.NET Core runtime";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.aspnetcore-runtime.version;
      "io.nix-containers.image.upstream" = "https://dotnet.microsoft.com/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "aspnet,dotnet,runtime,web";
    };
  };
}