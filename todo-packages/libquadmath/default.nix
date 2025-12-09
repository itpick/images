{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libquadmath
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libquadmath";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libquadmath";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libquadmath";
    homepage = "https://github.com/TODO/libquadmath";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
