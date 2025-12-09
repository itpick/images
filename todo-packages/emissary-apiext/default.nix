{ lib, stdenv, fetchFromGitHub, ... }:

# Package: emissary-apiext
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "emissary-apiext";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "emissary-apiext";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for emissary-apiext";
    homepage = "https://github.com/TODO/emissary-apiext";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
