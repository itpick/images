{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libboost-filesystem
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libboost-filesystem";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libboost-filesystem";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libboost-filesystem";
    homepage = "https://github.com/TODO/libboost-filesystem";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
