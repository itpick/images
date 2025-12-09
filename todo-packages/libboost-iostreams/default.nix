{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libboost-iostreams
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libboost-iostreams";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libboost-iostreams";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libboost-iostreams";
    homepage = "https://github.com/TODO/libboost-iostreams";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
