{ mkImage, pkgs, lib, ... }:

# Microsoft build of Go - Go toolchain with the OpenSSL crypto backend
# https://github.com/microsoft/go

let
  version = "1.26.4-1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "go-msft";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://download.visualstudio.microsoft.com/download/pr/88c9f950-d0f1-46ac-90d0-8e8b4095e743/30d6f3c908b93744d77f0cfcc29a8d0b/go1.26.4-20260602.8.linux-amd64.tar.gz";
      hash = "sha256:09y9ydz4ax7jkwqfmp3iby57vdpvbz76ggcr18yn659yx3hp4zgy";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib pkgs.openssl ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share $out/bin
      cp -r go $out/share/go
      ln -s $out/share/go/bin/go $out/bin/go
      ln -s $out/share/go/bin/gofmt $out/bin/gofmt
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "go-msft";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/go" ];
  cmd = [ "version" ];
  labels = {
    "org.opencontainers.image.title" = "go-msft";
    "org.opencontainers.image.description" = "Microsoft build of the Go toolchain";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
