{ lib, stdenv, fetchFromGitHub, ... }:

# Package: librtmp
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "librtmp";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "librtmp";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for librtmp";
    homepage = "https://github.com/TODO/librtmp";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
