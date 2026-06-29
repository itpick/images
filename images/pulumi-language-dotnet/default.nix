{ mkImage, pkgs, lib, ... }:

# pulumi-language-dotnet - Pulumi .NET language host plugin
# https://github.com/pulumi/pulumi-dotnet

let
  version = "3.107.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pulumi-language-dotnet";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/pulumi/pulumi-dotnet/releases/download/v${version}/pulumi-language-dotnet-v${version}-linux-amd64.tar.gz";
      hash = "sha256-Zu9gRE+zA6D4DD1EWtfpIV6FqENI5d1cBbephYWIOXo=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 pulumi-language-dotnet $out/bin/pulumi-language-dotnet
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "pulumi-language-dotnet";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pulumi-language-dotnet" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pulumi-language-dotnet";
    "org.opencontainers.image.description" = "Pulumi .NET language host plugin";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
