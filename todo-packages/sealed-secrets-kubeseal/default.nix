{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sealed-secrets-kubeseal
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sealed-secrets-kubeseal";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sealed-secrets-kubeseal";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sealed-secrets-kubeseal";
    homepage = "https://github.com/TODO/sealed-secrets-kubeseal";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
