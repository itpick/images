{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libflac
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libflac";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libflac";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libflac";
    homepage = "https://github.com/TODO/libflac";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
