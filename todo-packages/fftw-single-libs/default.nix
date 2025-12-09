{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fftw-single-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fftw-single-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fftw-single-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fftw-single-libs";
    homepage = "https://github.com/TODO/fftw-single-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
