{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libicu77
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libicu77";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libicu77";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libicu77";
    homepage = "https://github.com/TODO/libicu77";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
