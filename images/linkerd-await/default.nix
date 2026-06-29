{ mkImage, pkgs, lib, ... }:

# linkerd-await - blocks until the Linkerd proxy is ready, then runs a command
# https://github.com/linkerd/linkerd-await

let
  version = "0.3.3";

  drv = pkgs.stdenv.mkDerivation {
    pname = "linkerd-await";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/linkerd/linkerd-await/releases/download/release/v${version}/linkerd-await-v${version}-amd64";
      hash = "sha256:094fgcgxdg0ahl0vbn1z3ms5s0f107iff9bn52aj4pl95ww8hcnj";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/linkerd-await
      runHook postInstall
    '';

    meta = with lib; {
      description = "Blocks until the Linkerd proxy is ready, then runs a program";
      homepage = "https://github.com/linkerd/linkerd-await";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "linkerd-await";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/linkerd-await" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "linkerd-await";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
