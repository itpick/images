{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxtst-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxtst-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxtst-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxtst-dev";
    homepage = "https://github.com/TODO/libxtst-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
