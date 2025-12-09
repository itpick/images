{ lib, stdenv, fetchFromGitHub, ... }:

# Package: monstache
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "monstache";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "monstache";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for monstache";
    homepage = "https://github.com/TODO/monstache";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
