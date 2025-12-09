{ lib, stdenv, fetchFromGitHub, ... }:

# Package: celeborn-0.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "celeborn";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "celeborn";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for celeborn";
    homepage = "https://github.com/TODO/celeborn";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
