{ mkImage, pkgs, lib, ... }:

# pulumi-language-java - Pulumi Java language host plugin
# https://github.com/pulumi/pulumi-java

let
  version = "1.32.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pulumi-language-java";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/pulumi/pulumi-java/releases/download/v${version}/pulumi-language-java-v${version}-linux-amd64.tar.gz";
      hash = "sha256-1wU7UBC9PM8cqIZI6dmPtVMUYwjU16e0GIgHfmCJ6mc=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 pulumi-language-java $out/bin/pulumi-language-java
      install -Dm755 pulumi-java-gen $out/bin/pulumi-java-gen
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "pulumi-language-java";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pulumi-language-java" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pulumi-language-java";
    "org.opencontainers.image.description" = "Pulumi Java language host plugin";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
