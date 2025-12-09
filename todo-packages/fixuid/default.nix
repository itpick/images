{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fixuid
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fixuid";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fixuid";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fixuid";
    homepage = "https://github.com/TODO/fixuid";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
