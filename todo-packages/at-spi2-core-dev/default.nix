{ lib, stdenv, fetchFromGitHub, ... }:

# Package: at-spi2-core-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "at-spi2-core-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "at-spi2-core-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for at-spi2-core-dev";
    homepage = "https://github.com/TODO/at-spi2-core-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
