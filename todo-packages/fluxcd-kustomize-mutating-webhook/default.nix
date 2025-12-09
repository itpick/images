{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fluxcd-kustomize-mutating-webhook
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fluxcd-kustomize-mutating-webhook";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fluxcd-kustomize-mutating-webhook";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fluxcd-kustomize-mutating-webhook";
    homepage = "https://github.com/TODO/fluxcd-kustomize-mutating-webhook";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
