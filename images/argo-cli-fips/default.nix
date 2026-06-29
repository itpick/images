{ mkImage, pkgs, lib, ... }:

# Argo Workflows CLI (argo-cli-fips variant) - upstream prebuilt release binary
# https://github.com/argoproj/argo-workflows
# The -fips suffix is an upstream naming variant; this packages the upstream argo binary.

let
  version = "4.0.6";

  drv = pkgs.stdenv.mkDerivation {
    pname = "argo";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/argoproj/argo-workflows/releases/download/v${version}/argo-linux-amd64.gz";
      hash = "sha256-js3CXczhdUEgk8ybBP3RBjsefWNekL5tAWQ/yyWjVuE=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.gzip ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      gunzip -c $src > argo
      install -Dm755 argo $out/bin/argo
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "argo-cli-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/argo" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "argo-cli-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
