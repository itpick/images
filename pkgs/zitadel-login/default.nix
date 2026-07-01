# ZITADEL Login - Next.js-based login UI for ZITADEL
# https://github.com/zitadel/zitadel (apps/login/)
#
# This is a standalone Next.js application that provides the login UI
# for ZITADEL identity management. It is built from the apps/login/
# directory of the zitadel/zitadel monorepo and runs on Node.js.
#
# Since the application is a complex pnpm monorepo with workspace
# dependencies (@zitadel/client, @zitadel/proto), we extract the
# pre-built standalone output from the upstream Docker image.

{ lib, stdenv, dockerTools, undocker }:

let
  version = "4.15.3";

  # Pull the upstream image (architecture-specific)
  upstreamImage = dockerTools.pullImage ({
    imageName = "ghcr.io/zitadel/zitadel-login";
    finalImageTag = "v${version}";
  } // (if stdenv.hostPlatform.isAarch64 then {
    imageDigest = "sha256:82a449a3042eaa0fce759ed3505ff31b5f1f577817ef8249d9690130c2ced81f";
    hash = "sha256-bfmzXCZcBvkZUXD5nGgZ81i3NWI+rmfDZyiHF/bXOEM=";
  } else {
    imageDigest = "sha256:d47f2c812dfdc26a9ec318a4c228f9cbfe235e852d8a504a4467f5659a621c97";
    hash = "sha256-mXfEw7OGCZWqoQAyEmLFu/mWqKRzm+WhNwHukSHVQ+Q=";
  }));

in stdenv.mkDerivation {
  pname = "zitadel-login";
  inherit version;

  src = upstreamImage;

  nativeBuildInputs = [ undocker ];

  dontUnpack = true;
  # pnpm virtual-store symlinks in the extracted image point to packages that
  # pnpm deduplicates. Some of these symlinks are absent in the extracted layer
  # because they are part of a separate node_modules directory that pnpm keeps
  # only at runtime. Skip the broken-symlink fixup check.
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/zitadel-login

    # Extract the /app directory from the upstream image
    undocker $src - | tar -xf - -C $out/lib/zitadel-login --strip-components=1 app/

    runHook postInstall
  '';

  meta = with lib; {
    description = "ZITADEL Login UI - Next.js-based login interface for ZITADEL";
    homepage = "https://github.com/zitadel/zitadel";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
