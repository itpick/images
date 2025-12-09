{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libdav1d
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libdav1d";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libdav1d";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libdav1d";
    homepage = "https://github.com/TODO/libdav1d";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
