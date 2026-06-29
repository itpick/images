{ mkImage, pkgs, lib, ... }:

# bank-vaults "template" command-line tool
# https://github.com/bank-vaults/bank-vaults
# Note: upstream prebuilt binary; FIPS compliance is not claimed.

let
  version = "1.33.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "bank-vaults-template-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/bank-vaults/bank-vaults/releases/download/v${version}/bank-vaults_${version}_Linux_x86_64.tar.gz";
      hash = "sha256:0xss7f32z7rwfycgs08p76g824nzwm741hhwdjn0hc0zf45p7nkf";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 template $out/bin/template
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "bank-vaults-template-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/template" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "bank-vaults-template-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
