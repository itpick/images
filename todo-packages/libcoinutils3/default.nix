{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcoinutils3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcoinutils3";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcoinutils3";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcoinutils3";
    homepage = "https://github.com/TODO/libcoinutils3";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
