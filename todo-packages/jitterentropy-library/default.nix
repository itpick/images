{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jitterentropy-library
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jitterentropy-library";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jitterentropy-library";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jitterentropy-library";
    homepage = "https://github.com/TODO/jitterentropy-library";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
