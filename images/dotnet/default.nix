{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for dotnet:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dotnet-runtime_8  # dotnet-10 (10.0.100-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libunwind  # libunwind (1.8.3-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.lttng-ust  # lttng-ust (2.14.0-r3)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   dotnet-10-runtime (10.0.100-r1)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

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