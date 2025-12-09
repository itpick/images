{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libboost-thread
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libboost-thread";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libboost-thread";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libboost-thread";
    homepage = "https://github.com/TODO/libboost-thread";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
