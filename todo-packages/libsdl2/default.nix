{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libsdl2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libsdl2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libsdl2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libsdl2";
    homepage = "https://github.com/TODO/libsdl2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
