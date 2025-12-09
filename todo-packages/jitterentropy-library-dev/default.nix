{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jitterentropy-library-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jitterentropy-library-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jitterentropy-library-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jitterentropy-library-dev";
    homepage = "https://github.com/TODO/jitterentropy-library-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
