{ lib, stdenv, fetchFromGitHub, ... }:

# Package: emissary
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "emissary";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "emissary";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for emissary";
    homepage = "https://github.com/TODO/emissary";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
