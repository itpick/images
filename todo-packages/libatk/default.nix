{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libatk-1.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libatk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libatk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libatk";
    homepage = "https://github.com/TODO/libatk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
