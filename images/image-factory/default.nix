{ mkImage, pkgs, lib, ... }:

# image-factory - Talos Linux image factory service (Sidero Labs)
# https://github.com/siderolabs/image-factory
let
  version = "1.3.3";

  drv = pkgs.stdenv.mkDerivation {
    pname = "image-factory";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/siderolabs/image-factory/releases/download/v${version}/image-factory-linux-amd64";
      hash = "sha256:085s56d5ss2dqmzyrlcjjdm8pmkva3bl423961gqxczyxqg37044";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/image-factory
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "image-factory";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/image-factory" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "image-factory";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
