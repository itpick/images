{ mkImage, pkgs, lib, ... }:

# rekor-cli — upstream prebuilt release binary
let
  version = "1.5.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "rekor-cli";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/sigstore/rekor/releases/download/v1.5.2/rekor-cli-linux-amd64";
      hash = "sha256-5R4MeBWfg9OhcTmQ4JqxkESVBLCpFLqJu6U6UuWnYfk=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/rekor-cli
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "rekor-fips-cli";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/rekor-cli" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "rekor-fips-cli";
    "org.opencontainers.image.description" = "Sigstore Rekor CLI";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
