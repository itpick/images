{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sealed-secrets
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sealed-secrets";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sealed-secrets";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sealed-secrets";
    homepage = "https://github.com/TODO/sealed-secrets";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
