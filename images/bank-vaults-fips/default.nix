{ mkImage, pkgs, lib, ... }:

# bank-vaults - CLI for HashiCorp Vault automation
# https://github.com/bank-vaults/bank-vaults
let
  version = "1.33.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "bank-vaults";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/bank-vaults/bank-vaults/releases/download/v${version}/bank-vaults_${version}_Linux_x86_64.tar.gz";
      hash = "sha256-btpzC3EfMAisbBzCQE7l3xKBnjkXAf2YdzyfL4Y7Wnc=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 bank-vaults $out/bin/bank-vaults
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "bank-vaults-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/bank-vaults" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "bank-vaults";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
