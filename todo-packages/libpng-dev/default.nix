{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libpng-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libpng-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libpng-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libpng-dev";
    homepage = "https://github.com/TODO/libpng-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
