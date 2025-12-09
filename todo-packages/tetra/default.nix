{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tetra
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tetra";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tetra";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tetra";
    homepage = "https://github.com/TODO/tetra";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
