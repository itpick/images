{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for aspnet-runtime:
# Packages available in nixpkgs:
#   pkgs.dotnet-runtime_8  # dotnet-10 (10.0.100-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libunwind  # libunwind (1.8.3-r1)
#   pkgs.lttng-ust  # lttng-ust (2.14.0-r3)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   aspnet-10-runtime (10.0.100-r1)
#   dotnet-10-runtime (10.0.100-r1)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

let
  aspnetPackages = with pkgs; [
    dotnet-runtime_8
    bash
    coreutils
    # Additional packages from Chainguard SBOM
    icu
    libunwind
    lttng-ust
    tzdata
    xz
    zlib
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
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.description" = "ASP.NET Core runtime";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.dotnet-runtime_8.version;
      "io.nix-containers.image.upstream" = "https://dotnet.microsoft.com/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "aspnet,dotnet,runtime,web";
    };
  };
}