{ mkImage, pkgs, lib, ... }:

# Falcosidekick - connect Falco to your ecosystem
# https://github.com/falcosecurity/falcosidekick

let
  version = "2.34.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "falcosidekick";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/falcosecurity/falcosidekick/releases/download/${version}/falcosidekick_${version}_linux_amd64.tar.gz";
      hash = "sha256:17s2kizbrd3k895wfzjz4kxhydjggv9lmriljcyz05b3zyw3lyli";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 falcosidekick $out/bin/falcosidekick
      runHook postInstall
    '';

    meta = with lib; {
      description = "Connect Falco to your ecosystem";
      homepage = "https://github.com/falcosecurity/falcosidekick";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "falcosidekick";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/falcosidekick" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "falcosidekick";
    "org.opencontainers.image.description" = "Connect Falco to your ecosystem";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
