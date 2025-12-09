{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libnspr
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libnspr";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libnspr";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libnspr";
    homepage = "https://github.com/TODO/libnspr";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
