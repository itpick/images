{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libucx0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libucx0";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libucx0";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libucx0";
    homepage = "https://github.com/TODO/libucx0";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
