{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fribidi-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fribidi-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fribidi-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fribidi-dev";
    homepage = "https://github.com/TODO/fribidi-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
