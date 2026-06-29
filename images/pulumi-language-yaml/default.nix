{ mkImage, pkgs, lib, ... }:

# pulumi-language-yaml - Pulumi YAML language host plugin
# https://github.com/pulumi/pulumi-yaml

let
  version = "1.37.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pulumi-language-yaml";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/pulumi/pulumi-yaml/releases/download/v${version}/pulumi-language-yaml-v${version}-linux-amd64.tar.gz";
      hash = "sha256-KTJLJvsAN6SkkJPudUN5wqO/UU+mgVegmL7URmuvjp4=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 pulumi-language-yaml $out/bin/pulumi-language-yaml
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "pulumi-language-yaml";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pulumi-language-yaml" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pulumi-language-yaml";
    "org.opencontainers.image.description" = "Pulumi YAML language host plugin";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
