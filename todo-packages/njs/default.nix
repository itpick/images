{ lib, stdenv, fetchFromGitHub, ... }:

# Package: njs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "njs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "njs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for njs";
    homepage = "https://github.com/TODO/njs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
