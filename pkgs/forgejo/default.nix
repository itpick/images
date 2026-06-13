{ lib, stdenv, fetchurl }:

# https://codeberg.org/forgejo/forgejo
# Override nixpkgs forgejo: bump to 15.0.3 ahead of nixpkgs 15.0.1.
# Uses the upstream statically-linked prebuilt binary (no autoPatchelf needed).

let
  version = "15.0.3";
  srcs = {
    x86_64-linux = fetchurl {
      url = "https://codeberg.org/forgejo/forgejo/releases/download/v${version}/forgejo-${version}-linux-amd64.xz";
      hash = "sha256-SvyyeROaVUrW/pEAUAZf92ra2CMFGZTSALUJv8PJTXs=";
    };
    aarch64-linux = fetchurl {
      url = "https://codeberg.org/forgejo/forgejo/releases/download/v${version}/forgejo-${version}-linux-arm64.xz";
      hash = "sha256-FGsGm0AHoOECVyk8aXMj92GpjlfNxGAog6OLdjvOwR8=";
    };
  };
in stdenv.mkDerivation {
  pname = "forgejo";
  inherit version;

  src = srcs.${stdenv.hostPlatform.system};

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    xz -d -c $src > $out/bin/gitea
    chmod +x $out/bin/gitea
    runHook postInstall
  '';

  meta = with lib; {
    description = "Self-hosted Git service — community-managed fork of Gitea";
    homepage = "https://forgejo.org";
    license = licenses.mit;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
    sourceProvenance = [ sourceTypes.binaryNativeCode ];
    mainProgram = "gitea";
  };
}
