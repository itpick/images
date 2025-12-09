{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gpgv
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gpgv";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gpgv";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gpgv";
    homepage = "https://github.com/TODO/gpgv";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
