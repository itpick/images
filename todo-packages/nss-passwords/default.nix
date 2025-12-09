{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nss-passwords
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nss-passwords";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nss-passwords";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nss-passwords";
    homepage = "https://github.com/TODO/nss-passwords";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
